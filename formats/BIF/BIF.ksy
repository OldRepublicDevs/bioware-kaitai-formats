meta:
  id: bif
  title: BioWare BIF (Binary Index Format) File
  license: MIT
  endian: le
  file-extension: bif
  xref:
    pykotor: Libraries/PyKotor/src/pykotor/resource/formats/bif/
    reone: vendor/reone/src/libs/resource/format/bifreader.cpp
    xoreos: vendor/xoreos/src/aurora/biffile.cpp
    kotor_js: vendor/KotOR.js/src/resource/BIFObject.ts
    kotor_unity: vendor/KotOR-Unity/Assets/Scripts/FileObjects/BIFObject.cs
    wiki: vendor/PyKotor/wiki/BIF-File-Format.md
    torlack: vendor/xoreos-docs/specs/torlack/bif.html
doc: |
  BIF (BioWare Index File) files are archive containers that store game resources. They work in
  tandem with KEY files which provide the filename-to-resource mappings.

  BIF files contain only resource IDs, types, and data - the actual filenames (ResRefs) are stored
  in the KEY file and matched via the resource ID. This separation allows multiple BIF files to be
  indexed by a single KEY file, enabling efficient resource management across multiple archives.

  Binary Format Structure:
  - File Header (20 bytes): File type signature ("BIFF"), version ("V1  " or "V1.1"), resource
    counts, and offset to variable resource table
  - Variable Resource Table (20 bytes per entry): Array of resource entries containing resource_id,
    offset, file_size, and resource_type. Each entry is 20 bytes (4 bytes × 5 fields)
  - Resource Data (variable size): Raw binary data for each resource, stored at offsets specified
    in the resource table

  Resource ID Encoding:
  The resource_id field encodes both the BIF index and the resource index within that BIF:
  - Bits 31-20: BIF index (which BIF file this resource belongs to)
  - Bits 19-0: Resource index (index within the BIF file)
  - Formula: resource_id = (bif_index << 20) | resource_index

  This encoding allows the KEY file to reference resources across multiple BIF files using a
  single resource_id value.

  Fixed Resources:
  KotOR BIF files always have fixed_res_count = 0. Fixed-size resources are a legacy feature from
  Neverwinter Nights and are not used in KotOR. The field is present for format compatibility.

  File Access Pattern:
  1. Read header to get var_res_count and var_table_offset
  2. Read variable resource table to get resource entries
  3. Use resource_id to match with KEY file entries (to get ResRef)
  4. Read resource data from offset with size file_size

  References:
  - vendor/PyKotor/wiki/BIF-File-Format.md - Complete BIF format documentation
  - vendor/xoreos-docs/specs/torlack/bif.html - Tim Smith/Torlack's BIF documentation
  - vendor/reone/src/libs/resource/format/bifreader.cpp - Complete C++ BIF reader implementation
  - vendor/xoreos/src/aurora/biffile.cpp - Generic Aurora BIF implementation (shared format)
  - vendor/KotOR.js/src/resource/BIFObject.ts - TypeScript BIF parser
  - vendor/KotOR-Unity/Assets/Scripts/FileObjects/BIFObject.cs - C# Unity BIF loader
  - Libraries/PyKotor/src/pykotor/resource/formats/bif/io_bif.py - PyKotor binary reader/writer
  - Libraries/PyKotor/src/pykotor/resource/formats/bif/bif_data.py - BIF data model

seq:
  - id: file_type
    type: str
    encoding: ASCII
    size: 4
    doc: File type signature. Must be "BIFF" for BIF files.
    valid: "BIFF"
  
  - id: version
    type: str
    encoding: ASCII
    size: 4
    doc: |
      File format version. Typically "V1  " (space-padded) or "V1.1" for KotOR BIF files.
      Valid values: "V1  " (space-padded), "V1.1"
  
  - id: var_res_count
    type: u4
    doc: Number of variable-size resources in this file.
  
  - id: fixed_res_count
    type: u4
    doc: Number of fixed-size resources (always 0 in KotOR, legacy from NWN).
    valid: 0
  
  - id: var_table_offset
    type: u4
    doc: Byte offset to the variable resource table from the beginning of the file.
  
  - id: var_resource_table
    type: var_resource_table
    if: var_res_count > 0
    pos: var_table_offset
    doc: Variable resource table containing entries for each resource.

types:
  var_resource_table:
    seq:
      - id: entries
        type: var_resource_entry
        repeat: expr
        repeat-expr: _root.var_res_count
        doc: Array of variable resource entries.
  
  var_resource_entry:
    seq:
      - id: resource_id
        type: u4
        doc: |
          Resource ID (matches KEY file entry).
          Encodes BIF index (bits 31-20) and resource index (bits 19-0).
          Formula: resource_id = (bif_index << 20) | resource_index
      
      - id: offset
        type: u4
        doc: Byte offset to resource data in file (absolute file offset).
      
      - id: file_size
        type: u4
        doc: Uncompressed size of resource data in bytes.
      
      - id: resource_type
        type: u4
        doc: Resource type identifier (see ResourceType enum).
      
      - id: data
        type: str
        size: file_size
        pos: offset
        doc: Raw binary data for the resource (read at specified offset).

