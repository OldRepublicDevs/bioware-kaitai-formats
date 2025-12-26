#ifndef UTM_H_
#define UTM_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class utm_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include "gff.h"

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * UTM (Store/Merchant Template) files define merchant inventories and prices.
 * 
 * UTM files contain:
 * - Root struct with merchant metadata:
 *   - ResRef: Merchant template ResRef (unique identifier, max 16 characters, ResRef type)
 *   - LocName: Localized merchant name (LocalizedString/CExoLocString type)
 *   - Tag: Merchant tag identifier (String/CExoString type, used for scripting references)
 *   - MarkUp: Markup percentage for selling items to player (Int32, typically 0-200, represents percentage)
 *   - MarkDown: Markdown percentage for buying items from player (Int32, typically 0-200, represents percentage)
 *   - OnOpenStore: Script ResRef executed when store opens (ResRef type, max 16 characters)
 *   - Comment: Developer comment string (String/CExoString type, not used by game engine)
 *   - BuySellFlag: Flags for buy/sell capabilities (UInt8/Byte type)
 *     - Bit 0 (mask 0x01): Can buy items (1 = can buy, 0 = cannot buy)
 *     - Bit 1 (mask 0x02): Can sell items (1 = can sell, 0 = cannot sell)
 *     - Bits 2-7: Reserved/unused
 *   - ID: Deprecated field, not used by game engine (UInt8/Byte type)
 * - ItemList: Array of UTM_ItemList structs containing merchant inventory items (List type)
 *   Each item (struct_id typically 0 or custom) contains:
 *   - InventoryRes: Item ResRef (ResRef type, max 16 characters, references the item template UTI file)
 *   - Infinite: Whether item stock is infinite (UInt8/Byte type, 0 = finite stock, 1 = infinite stock)
 *   - Dropable: Whether item is droppable by merchant (UInt8/Byte type, 0 = not droppable, 1 = droppable)
 *     Note: Field name is "Dropable" (not "Droppable") in the binary format
 *   - Repos_PosX: X position in merchant inventory grid (UInt16 type, grid coordinate)
 *   - Repos_PosY: Y position in merchant inventory grid (UInt16 type, grid coordinate)
 * 
 * The BuySellFlag field encodes two boolean flags in a single byte:
 * - Value 0: Cannot buy, cannot sell
 * - Value 1: Can buy, cannot sell (bit 0 set)
 * - Value 2: Cannot buy, can sell (bit 1 set)
 * - Value 3: Can buy, can sell (bits 0 and 1 set)
 * 
 * References:
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-UTM.md
 * - https://github.com/OldRepublicDevs/PyKotor/wiki/GFF-File-Format.md
 * - https://github.com/seedhartha/reone/blob/master/include/reone/resource/parser/gff/utm.h:35-46 (UTM struct definition)
 * - https://github.com/seedhartha/reone/blob/master/src/libs/resource/parser/gff/utm.cpp:37-52 (UTM parsing from GFF)
 * - https://github.com/OldRepublicDevs/PyKotor/blob/master/Libraries/PyKotor/src/pykotor/resource/generics/utm.py:16-223 (PyKotor implementation)
 */

class utm_t : public kaitai::kstruct {

public:

    utm_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, utm_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~utm_t();

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
    utm_t* m__root;
    kaitai::kstruct* m__parent;

public:
    gff_t::gff_t* gff_data() const { return m_gff_data; }
    utm_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // UTM_H_
