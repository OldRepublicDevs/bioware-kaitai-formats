#!/usr/bin/env python3
"""
Generate PyKotor-compatible wrapper classes from Kaitai Struct parsers.

This script generates:
1. BinaryReader classes (using Kaitai parsers)
2. BinaryWriter classes (custom implementation)
3. read_<format> functions (supporting binary/XML/JSON)
4. write_<format> functions (supporting binary/XML/JSON)
5. bytes_<format> functions (format conversion)
6. <Format> data classes (matching PyKotor structure)
"""

from __future__ import annotations

from pathlib import Path
from typing import Dict, List

# Format metadata extracted from .ksy files
FORMAT_METADATA = {
    "are": {
        "name": "ARE",
        "full_name": "Area",
        "file_type": "ARE ",
        "base_class": "GenericBase",
        "resource_type": "ResourceType.ARE",
    },
    "utc": {
        "name": "UTC",
        "full_name": "Creature Template",
        "file_type": "UTC ",
        "base_class": "GenericBase",
        "resource_type": "ResourceType.UTC",
    },
    # ... more formats
}


def generate_binary_reader(format_code: str) -> str:
    """Generate BinaryReader class for a format."""
    meta = FORMAT_METADATA[format_code]
    
    return f'''"""
Binary reader for {meta['full_name']} ({meta['name']}) files.
Auto-generated from {format_code}.ksy
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.resource.formats.gff import GFFBinaryReader
from kaitai_generated.{format_code} import {meta['name']} as Kaitai{meta['name']}

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES
    from pykotor.resource.generics.{format_code} import {meta['name']}


class {meta['name']}BinaryReader(GFFBinaryReader):
    """
    Binary reader for {meta['name']} files using Kaitai Struct parser.
    
    This class wraps the Kaitai-generated parser and provides a PyKotor-compatible
    interface for reading {meta['name']} files.
    """
    
    def __init__(
        self,
        source: SOURCE_TYPES,
        offset: int = 0,
        size: int | None = None,
    ):
        """Initialize {meta['name']} binary reader.
        
        Args:
        ----
            source: Source to read from (bytes, file path, or file-like object)
            offset: Byte offset to start reading from
            size: Number of bytes to read (None = read all)
        """
        super().__init__(source, offset, size)
        self._kaitai_obj: Kaitai{meta['name']} | None = None
    
    def load(self, target: {meta['name']}) -> {meta['name']}:
        """Load {meta['name']} data from source into target object.
        
        Args:
        ----
            target: {meta['name']} object to populate
            
        Returns:
        -------
            The populated {meta['name']} object
        """
        # Parse using Kaitai Struct
        self._kaitai_obj = Kaitai{meta['name']}.from_bytes(self._data)
        
        # Convert Kaitai structure to PyKotor object
        return self._kaitai_to_pykotor(self._kaitai_obj, target)
    
    def _kaitai_to_pykotor(
        self,
        kaitai_obj: Kaitai{meta['name']},
        target: {meta['name']},
    ) -> {meta['name']}:
        """Convert Kaitai structure to PyKotor {meta['name']} object.
        
        Args:
        ----
            kaitai_obj: Parsed Kaitai structure
            target: Target {meta['name']} object to populate
            
        Returns:
        -------
            Populated {meta['name']} object
        """
        # Access GFF data through Kaitai parser
        gff = kaitai_obj.gff_data
        root_struct = gff.struct_array.entries[0]
        
        # Extract fields from GFF structure
        # TODO: Auto-generate field extraction based on .ksy metadata
        
        return target
'''


def generate_binary_writer(format_code: str) -> str:
    """Generate BinaryWriter class for a format."""
    meta = FORMAT_METADATA[format_code]
    
    return f'''"""
Binary writer for {meta['full_name']} ({meta['name']}) files.
Auto-generated from {format_code}.ksy
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.resource.formats.gff import GFFBinaryWriter

if TYPE_CHECKING:
    from pykotor.resource.type import TARGET_TYPES
    from pykotor.resource.generics.{format_code} import {meta['name']}


class {meta['name']}BinaryWriter(GFFBinaryWriter):
    """
    Binary writer for {meta['name']} files.
    
    This class provides PyKotor-compatible interface for writing {meta['name']} files
    to binary format.
    """
    
    def __init__(
        self,
        target: TARGET_TYPES,
        file_type: str = "{meta['file_type']}",
        file_version: str = "V3.2",
    ):
        """Initialize {meta['name']} binary writer.
        
        Args:
        ----
            target: Target to write to (file path or file-like object)
            file_type: GFF file type signature (default: "{meta['file_type']}")
            file_version: GFF version (default: "V3.2")
        """
        super().__init__(target, file_type, file_version)
    
    def write(self, {format_code}: {meta['name']}) -> bytes:
        """Write {meta['name']} object to binary format.
        
        Args:
        ----
            {format_code}: {meta['name']} object to write
            
        Returns:
        -------
            Binary data as bytes
        """
        # Convert PyKotor object to GFF structure
        gff = self._pykotor_to_gff({format_code})
        
        # Write GFF to binary
        return self._write_gff(gff)
    
    def _pykotor_to_gff(self, {format_code}: {meta['name']}) -> GFF:
        """Convert PyKotor {meta['name']} object to GFF structure.
        
        Args:
        ----
            {format_code}: {meta['name']} object to convert
            
        Returns:
        -------
            GFF structure
        """
        from pykotor.resource.formats.gff import GFF, GFFStruct
        
        gff = GFF()
        gff.file_type = "{meta['file_type']}"
        gff.file_version = "V3.2"
        
        root = GFFStruct()
        
        # TODO: Auto-generate field serialization based on .ksy metadata
        
        gff.root = root
        return gff
'''


def generate_api_functions(format_code: str) -> str:
    """Generate read/write/bytes API functions."""
    meta = FORMAT_METADATA[format_code]
    
    return f'''"""
API functions for {meta['full_name']} ({meta['name']}) files.
Auto-generated from {format_code}.ksy
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.{format_code} import {meta['name']}


def read_{format_code}(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
    file_format: ResourceType | None = None,
) -> {meta['name']}:
    """Read {meta['name']} from source.
    
    Automatically detects format (binary, XML, JSON) and uses appropriate parser.
    
    Args:
    ----
        source: Source to read from (bytes, file path, or file-like object)
        offset: Byte offset to start reading from
        size: Number of bytes to read (None = read all)
        file_format: Force specific format (None = auto-detect)
        
    Returns:
    -------
        Parsed {meta['name']} object
        
    Example:
    -------
        >>> {format_code} = read_{format_code}("test.{format_code}")
        >>> {format_code} = read_{format_code}("test.{format_code}.xml")
        >>> {format_code} = read_{format_code}(binary_data)
    """
    from pykotor.resource.generics.{format_code} import {meta['name']}
    from pykotor.resource.formats.gff import read_gff
    
    # Auto-detect format if not specified
    if file_format is None:
        file_format = _detect_format(source)
    
    # Read based on format
    if file_format == ResourceType.GFF:
        # Binary format
        from .io_{format_code} import {meta['name']}BinaryReader
        reader = {meta['name']}BinaryReader(source, offset, size)
        return reader.load({meta['name']}())
    
    elif file_format == ResourceType.GFF_XML:
        # XML format
        gff = read_gff(source, offset, size, file_format=ResourceType.GFF_XML)
        from .{format_code}_data import construct_{format_code}
        return construct_{format_code}(gff)
    
    elif file_format == ResourceType.GFF_JSON:
        # JSON format
        gff = read_gff(source, offset, size, file_format=ResourceType.GFF_JSON)
        from .{format_code}_data import construct_{format_code}
        return construct_{format_code}(gff)
    
    else:
        raise ValueError(f"Unsupported format: {{file_format}}")


def write_{format_code}(
    {format_code}: {meta['name']},
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write {meta['name']} to target.
    
    Args:
    ----
        {format_code}: {meta['name']} object to write
        target: Target to write to (file path or file-like object)
        game: Target game version (affects field compatibility)
        file_format: Output format (GFF, GFF_XML, or GFF_JSON)
        
    Returns:
    -------
        Written data as bytes
        
    Example:
    -------
        >>> write_{format_code}({format_code}, "output.{format_code}")
        >>> write_{format_code}({format_code}, "output.{format_code}.xml", file_format=ResourceType.GFF_XML)
    """
    from pykotor.resource.formats.gff import write_gff
    
    if file_format == ResourceType.GFF:
        # Binary format
        from .io_{format_code} import {meta['name']}BinaryWriter
        writer = {meta['name']}BinaryWriter(target)
        return writer.write({format_code})
    
    elif file_format in (ResourceType.GFF_XML, ResourceType.GFF_JSON):
        # XML/JSON format
        from .{format_code}_data import dismantle_{format_code}
        gff = dismantle_{format_code}({format_code})
        return write_gff(gff, target, file_format=file_format)
    
    else:
        raise ValueError(f"Unsupported format: {{file_format}}")


def bytes_{format_code}(
    {format_code}: {meta['name']},
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert {meta['name']} to bytes in specified format.
    
    Args:
    ----
        {format_code}: {meta['name']} object to convert
        game: Target game version
        file_format: Output format (GFF, GFF_XML, or GFF_JSON)
        
    Returns:
    -------
        {meta['name']} data as bytes
        
    Example:
    -------
        >>> data = bytes_{format_code}({format_code})
        >>> xml_data = bytes_{format_code}({format_code}, file_format=ResourceType.GFF_XML)
    """
    from io import BytesIO
    
    buffer = BytesIO()
    write_{format_code}({format_code}, buffer, game, file_format)
    return buffer.getvalue()


def _detect_format(source: SOURCE_TYPES) -> ResourceType:
    """Auto-detect format from source.
    
    Args:
    ----
        source: Source to detect format from
        
    Returns:
    -------
        Detected ResourceType
    """
    # Check file extension if source is path
    if isinstance(source, (str, Path)):
        path = Path(source)
        if path.suffix == ".xml":
            return ResourceType.GFF_XML
        elif path.suffix == ".json":
            return ResourceType.GFF_JSON
    
    # Check magic bytes if source is bytes
    if isinstance(source, bytes):
        if source.startswith(b"<"):
            return ResourceType.GFF_XML
        elif source.startswith(b"{{"):
            return ResourceType.GFF_JSON
    
    # Default to binary
    return ResourceType.GFF
'''


def main():
    """Generate all wrapper files."""
    output_dir = Path("src/python/wrappers")
    output_dir.mkdir(parents=True, exist_ok=True)
    
    for format_code in FORMAT_METADATA:
        print(f"Generating wrappers for {format_code}...")
        
        # Generate reader
        reader_file = output_dir / f"io_{format_code}_reader.py"
        reader_file.write_text(generate_binary_reader(format_code))
        
        # Generate writer
        writer_file = output_dir / f"io_{format_code}_writer.py"
        writer_file.write_text(generate_binary_writer(format_code))
        
        # Generate API functions
        api_file = output_dir / f"{format_code}_auto.py"
        api_file.write_text(generate_api_functions(format_code))
        
        print(f"  ✓ Generated {format_code} wrappers")


if __name__ == "__main__":
    main()

