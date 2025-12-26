#ifndef DLG_H_
#define DLG_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class dlg_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * DLG (Dialogue) files are GFF-based format files that store conversation trees with entries, replies,
 * links, and conversation metadata for Odyssey and Aurora engines.
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds DLG-specific
 * validation and documentation.
 * 
 * DLG files contain:
 * - Root struct with conversation metadata (NumWords, Skippable, ConversationType, etc.)
 * - EntryList: Array of dialogue entries (NPC lines)
 * - ReplyList: Array of reply options (player responses)
 * - StartingList: Array of entry points into conversation tree
 * - StuntList: Array of cutscene/animation sequences
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-DLG.md
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/generics/dlg/
 */

class dlg_t : public kaitai::kstruct {

public:

    dlg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, dlg_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~dlg_t();

private:
    bool f_file_type_valid;
    bool m_file_type_valid;

public:

    /**
     * Validates DLG file type
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
    dlg_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Complete GFF structure with "DLG " file type
     */
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    dlg_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // DLG_H_
