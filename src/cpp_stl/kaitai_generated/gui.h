#ifndef GUI_H_
#define GUI_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class gui_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * GUI (Graphical User Interface) files define UI layouts, controls, and properties.
 * 
 * This format inherits the complete GFF structure from gff.ksy.
 * 
 * GUI Root Struct Fields:
 * - CONTROLS (List): UI control elements (buttons, labels, listboxes, etc.)
 * - Each control contains:
 *   - CONTROLTYPE (Int32): Control type (button=4, label=5, listbox=9, etc.)
 *   - TAG (String): Control identifier
 *   - X, Y, WIDTH, HEIGHT (Int32): Position and size
 *   - TEXT (Struct): Text properties with STRREF, color, alignment
 *   - BORDER (Struct): Border properties
 *   - EXTENT (Struct): Dimensions
 *   - Various control-specific fields
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-GUI.md
 */

class gui_t : public kaitai::kstruct {

public:

    gui_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gui_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~gui_t();

private:
    bool f_file_type_valid;
    bool m_file_type_valid;

public:
    bool file_type_valid();

private:
    bool f_version_valid;
    bool m_version_valid;

public:
    bool version_valid();

private:
    gff_t::gff_t* m_gff_data;
    gui_t* m__root;
    kaitai::kstruct* m__parent;

public:
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    gui_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // GUI_H_
