#ifndef NCS_MINIMAL_H_
#define NCS_MINIMAL_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class ncs_minimal_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

class ncs_minimal_t : public kaitai::kstruct {

public:
    class instruction_t;

    ncs_minimal_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, ncs_minimal_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~ncs_minimal_t();

    class instruction_t : public kaitai::kstruct {

    public:

        instruction_t(kaitai::kstream* p__io, ncs_minimal_t* p__parent = 0, ncs_minimal_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~instruction_t();

    private:
        uint8_t m_bytecode;
        uint8_t m_qualifier;
        ncs_minimal_t* m__root;
        ncs_minimal_t* m__parent;

    public:
        uint8_t bytecode() const { return m_bytecode; }
        uint8_t qualifier() const { return m_qualifier; }
        ncs_minimal_t* _root() const { return m__root; }
        ncs_minimal_t* _parent() const { return m__parent; }
    };

private:
    std::string m_file_type;
    std::string m_file_version;
    uint8_t m_size_marker;
    uint32_t m_total_file_size;
    std::vector<instruction_t*>* m_instructions;
    ncs_minimal_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string file_type() const { return m_file_type; }
    std::string file_version() const { return m_file_version; }
    uint8_t size_marker() const { return m_size_marker; }
    uint32_t total_file_size() const { return m_total_file_size; }
    std::vector<instruction_t*>* instructions() const { return m_instructions; }
    ncs_minimal_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // NCS_MINIMAL_H_
