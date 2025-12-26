#ifndef ARE_H_
#define ARE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class are_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * ARE (Area) files are GFF-based format files that store static area information including
 * lighting, fog, grass, weather, script hooks, and map data. ARE files use the GFF (Generic File Format)
 * binary structure with file type signature "ARE ".
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds ARE-specific
 * validation and documentation.
 * 
 * ARE Root Struct Fields (Common):
 * - "Tag" (String): Unique area identifier
 * - "Name" (LocalizedString): Area display name
 * - "SunAmbientColor", "SunDiffuseColor" (UInt32): Lighting colors (BGR format)
 * - "SunFogOn", "SunFogNear", "SunFogFar", "SunFogColor": Fog settings
 * - "Grass_*": Grass rendering properties
 * - "OnEnter", "OnExit", "OnHeartbeat", "OnUserDefined": Script hooks (ResRef)
 * - "Map" (Struct): Minimap coordinate mapping
 * - "Rooms" (List): Audio zones and weather regions
 * 
 * KotOR 2 adds weather fields:
 * - "ChanceRain", "ChanceSnow", "ChanceLightning" (Int32)
 * - "Dirty*" fields for dust particle effects
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-ARE.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/are.py
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/are.cpp
 */

class are_t : public kaitai::kstruct {

public:

    are_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, are_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~are_t();

private:
    bool f_file_type_valid;
    bool m_file_type_valid;

public:

    /**
     * Validates that this is an ARE file (file type must be "ARE ")
     */
    bool file_type_valid();

private:
    bool f_root_struct_resolved;
    resolved_struct_t* m_root_struct_resolved;

public:

    /**
     * Convenience access to the decoded GFF root struct (struct_array[0]).
     * Use this to iterate all resolved fields (label + typed value), including:
     * "Tag", "Name", "AlphaTest", "Map" (struct), "Rooms" (list), and all KotOR2/deprecated keys.
     */
    resolved_struct_t* root_struct_resolved();

private:
    bool f_version_valid;
    bool m_version_valid;

public:

    /**
     * Validates GFF version is supported
     */
    bool version_valid();

private:
    gff_t::gff_t* m_gff_data;
    are_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Complete GFF structure. ARE files use standard GFF format with "ARE " file type.
     * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
     */
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    are_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // ARE_H_
