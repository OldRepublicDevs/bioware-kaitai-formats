#ifndef TWODA_CSV_H_
#define TWODA_CSV_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class twoda_csv_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * TwoDA CSV format is a human-readable CSV (Comma-Separated Values) representation of TwoDA files.
 * Provides easier editing in spreadsheet applications than binary TwoDA format.
 * 
 * Each row represents a data row, with the first row containing column headers.
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/tree/master/Libraries/PyKotor/src/pykotor/resource/formats/twoda/io_twoda.py
 */

class twoda_csv_t : public kaitai::kstruct {

public:

    twoda_csv_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, twoda_csv_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~twoda_csv_t();

private:
    std::string m_csv_content;
    twoda_csv_t* m__root;
    kaitai::kstruct* m__parent;

public:

    /**
     * CSV text content with rows separated by newlines and columns by commas
     */
    std::string csv_content() const { return m_csv_content; }
    twoda_csv_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // TWODA_CSV_H_
