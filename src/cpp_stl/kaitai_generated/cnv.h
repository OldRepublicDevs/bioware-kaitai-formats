#ifndef CNV_H_
#define CNV_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class cnv_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * CNV (Conversation) files are GFF-based format files that store conversation trees with entries, replies,
 * links, and conversation metadata. CNV files use the GFF (Generic File Format) binary structure
 * with file type signature "CNV ".
 * 
 * This format inherits the complete GFF structure from gff.ksy and adds CNV-specific
 * validation and documentation.
 * 
 * CNV files are used by Eclipse Engine games (Dragon Age Origins, Dragon Age 2, Mass Effect, Mass Effect 2).
 * They are similar to DLG files used by Odyssey and Aurora engines but adapted for Eclipse's conversation system.
 * 
 * CNV Root Struct Fields:
 * - NumWords (Int32): Word count for conversation
 * - Skippable (UInt8): Whether conversation can be skipped
 * - ConversationType (Int32): Conversation type identifier
 * - EntryList (List): NPC dialogue lines (CNVEntry structs)
 * - ReplyList (List): Player response options (CNVReply structs)
 * - StartingList (List): Entry points (CNVLink structs)
 * - StuntList (List): Special animations (CNVStunt structs)
 * 
 * Each Entry/Reply contains:
 * - Text (LocalizedString): Dialogue text
 * - Script (ResRef): Conditional/action scripts
 * - Camera settings, animations, links to other nodes
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-CNV.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 */

class cnv_t : public kaitai::kstruct {

public:

    cnv_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, cnv_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~cnv_t();

private:
    bool f_file_type_valid;
    bool m_file_type_valid;

public:

    /**
     * Validates that this is a CNV file (file type must be "CNV ")
     */
    bool file_type_valid();

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
    cnv_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * Complete GFF structure. CNV files use standard GFF format with "CNV " file type.
     * Access via: gff_data.header, gff_data.struct_array, gff_data.field_array, etc.
     */
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    cnv_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // CNV_H_
