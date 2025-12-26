#ifndef BZF_H_
#define BZF_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class bzf_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * BZF (BioWare Zipped File) files are LZMA-compressed BIF files used primarily in iOS
 * (and maybe Android) ports of KotOR. The BZF header contains "BZF " + "V1.0", followed
 * by LZMA-compressed BIF data. Decompression reveals a standard BIF structure.
 * 
 * Format Structure:
 * - Header (8 bytes): File type signature "BZF " and version "V1.0"
 * - Compressed Data: LZMA-compressed BIF file data
 * 
 * After decompression, the data follows the standard BIF format structure.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/BIF-File-Format.md - BZF compression section
 * - BIF.ksy - Standard BIF format (decompressed BZF data matches this)
 */

class bzf_t : public kaitai::kstruct {

public:

    bzf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, bzf_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~bzf_t();

private:
    std::string m_file_type;
    std::string m_version;
    std::vector<uint8_t>* m_compressed_data;
    bzf_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * File type signature. Must be "BZF " for compressed BIF files.
     */
    std::string file_type() const { return m_file_type; }

    /**
     * File format version. Always "V1.0" for BZF files.
     */
    std::string version() const { return m_version; }

    /**
     * LZMA-compressed BIF file data.
     * This data must be decompressed using LZMA algorithm to obtain the standard BIF structure.
     * After decompression, the data can be parsed using the BIF format definition.
     */
    std::vector<uint8_t>* compressed_data() const { return m_compressed_data; }
    bzf_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // BZF_H_
