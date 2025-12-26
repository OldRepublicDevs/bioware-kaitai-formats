#ifndef FAC_H_
#define FAC_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class fac_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * FAC (Faction) files are GFF-based format files that store faction relationships,
 * reputation values, and faction metadata.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds FAC-specific
 * validation and documentation.
 * 
 * FAC Root Struct Fields:
 * - FactionName (String): Faction identifier
 * - FactionParentID (UInt16): Parent faction ID
 * - FactionGlobal (UInt16): Global faction flag
 * - RepList (List): Reputation values with other factions
 *   - FactionID (UInt32): Target faction ID
 *   - FactionRep (UInt32): Reputation value (0-100)
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-FAC.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/fac.py
 */

class fac_t : public kaitai::kstruct {

public:

    fac_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, fac_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~fac_t();

private:
    bool f_file_type_valid;
    bool m_file_type_valid;

public:

    /**
     * Validates FAC file type
     */
    bool file_type_valid();

private:
    bool f_version_valid;
    bool m_version_valid;

public:

    /**
     * Validates GFF version
     */
    bool version_valid();

private:
    gff_t::gff_t* m_gff_data;
    fac_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Complete GFF structure with "FAC " file type
     */
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    fac_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // FAC_H_
