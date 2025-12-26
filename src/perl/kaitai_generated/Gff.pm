# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Gff;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $GFF_FIELD_TYPE_UINT8 = 0;
our $GFF_FIELD_TYPE_INT8 = 1;
our $GFF_FIELD_TYPE_UINT16 = 2;
our $GFF_FIELD_TYPE_INT16 = 3;
our $GFF_FIELD_TYPE_UINT32 = 4;
our $GFF_FIELD_TYPE_INT32 = 5;
our $GFF_FIELD_TYPE_UINT64 = 6;
our $GFF_FIELD_TYPE_INT64 = 7;
our $GFF_FIELD_TYPE_SINGLE = 8;
our $GFF_FIELD_TYPE_DOUBLE = 9;
our $GFF_FIELD_TYPE_STRING = 10;
our $GFF_FIELD_TYPE_RESREF = 11;
our $GFF_FIELD_TYPE_LOCALIZED_STRING = 12;
our $GFF_FIELD_TYPE_BINARY = 13;
our $GFF_FIELD_TYPE_STRUCT = 14;
our $GFF_FIELD_TYPE_LIST = 15;
our $GFF_FIELD_TYPE_VECTOR4 = 16;
our $GFF_FIELD_TYPE_VECTOR3 = 17;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header} = Gff::GffHeader->new($self->{_io}, $self, $self->{_root});
}

sub field_array {
    my ($self) = @_;
    return $self->{field_array} if ($self->{field_array});
    if ($self->header()->field_count() > 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->header()->field_offset());
        $self->{field_array} = Gff::FieldArray->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{field_array};
}

sub field_data {
    my ($self) = @_;
    return $self->{field_data} if ($self->{field_data});
    if ($self->header()->field_data_count() > 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->header()->field_data_offset());
        $self->{field_data} = Gff::FieldData->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{field_data};
}

sub field_indices_array {
    my ($self) = @_;
    return $self->{field_indices_array} if ($self->{field_indices_array});
    if ($self->header()->field_indices_count() > 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->header()->field_indices_offset());
        $self->{field_indices_array} = Gff::FieldIndicesArray->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{field_indices_array};
}

sub label_array {
    my ($self) = @_;
    return $self->{label_array} if ($self->{label_array});
    if ($self->header()->label_count() > 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->header()->label_offset());
        $self->{label_array} = Gff::LabelArray->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{label_array};
}

sub list_indices_array {
    my ($self) = @_;
    return $self->{list_indices_array} if ($self->{list_indices_array});
    if ($self->header()->list_indices_count() > 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->header()->list_indices_offset());
        $self->{list_indices_array} = Gff::ListIndicesArray->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{list_indices_array};
}

sub struct_array {
    my ($self) = @_;
    return $self->{struct_array} if ($self->{struct_array});
    if ($self->header()->struct_count() > 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->header()->struct_offset());
        $self->{struct_array} = Gff::StructArray->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{struct_array};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

########################################################################
package Gff::FieldArray;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entries} = [];
    my $n_entries = $self->_root()->header()->field_count();
    for (my $i = 0; $i < $n_entries; $i++) {
        push @{$self->{entries}}, Gff::FieldEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Gff::FieldData;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{raw_data} = $self->{_io}->read_bytes($self->_root()->header()->field_data_count());
}

sub raw_data {
    my ($self) = @_;
    return $self->{raw_data};
}

########################################################################
package Gff::FieldEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{field_type} = $self->{_io}->read_u4le();
    $self->{label_index} = $self->{_io}->read_u4le();
    $self->{data_or_offset} = $self->{_io}->read_u4le();
}

sub field_data_offset_value {
    my ($self) = @_;
    return $self->{field_data_offset_value} if ($self->{field_data_offset_value});
    if ($self->is_complex_type()) {
        $self->{field_data_offset_value} = $self->_root()->header()->field_data_offset() + $self->data_or_offset();
    }
    return $self->{field_data_offset_value};
}

sub is_complex_type {
    my ($self) = @_;
    return $self->{is_complex_type} if ($self->{is_complex_type});
    $self->{is_complex_type} =  (($self->field_type() == $Gff::GFF_FIELD_TYPE_UINT64) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_INT64) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_DOUBLE) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_STRING) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_RESREF) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_LOCALIZED_STRING) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_BINARY) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_VECTOR4) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_VECTOR3)) ;
    return $self->{is_complex_type};
}

sub is_list_type {
    my ($self) = @_;
    return $self->{is_list_type} if ($self->{is_list_type});
    $self->{is_list_type} = $self->field_type() == $Gff::GFF_FIELD_TYPE_LIST;
    return $self->{is_list_type};
}

sub is_simple_type {
    my ($self) = @_;
    return $self->{is_simple_type} if ($self->{is_simple_type});
    $self->{is_simple_type} =  (($self->field_type() == $Gff::GFF_FIELD_TYPE_UINT8) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_INT8) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_UINT16) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_INT16) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_UINT32) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_INT32) || ($self->field_type() == $Gff::GFF_FIELD_TYPE_SINGLE)) ;
    return $self->{is_simple_type};
}

sub is_struct_type {
    my ($self) = @_;
    return $self->{is_struct_type} if ($self->{is_struct_type});
    $self->{is_struct_type} = $self->field_type() == $Gff::GFF_FIELD_TYPE_STRUCT;
    return $self->{is_struct_type};
}

sub list_indices_offset_value {
    my ($self) = @_;
    return $self->{list_indices_offset_value} if ($self->{list_indices_offset_value});
    if ($self->is_list_type()) {
        $self->{list_indices_offset_value} = $self->_root()->header()->list_indices_offset() + $self->data_or_offset();
    }
    return $self->{list_indices_offset_value};
}

sub struct_index_value {
    my ($self) = @_;
    return $self->{struct_index_value} if ($self->{struct_index_value});
    if ($self->is_struct_type()) {
        $self->{struct_index_value} = $self->data_or_offset();
    }
    return $self->{struct_index_value};
}

sub field_type {
    my ($self) = @_;
    return $self->{field_type};
}

sub label_index {
    my ($self) = @_;
    return $self->{label_index};
}

sub data_or_offset {
    my ($self) = @_;
    return $self->{data_or_offset};
}

########################################################################
package Gff::FieldIndicesArray;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{indices} = [];
    my $n_indices = $self->_root()->header()->field_indices_count();
    for (my $i = 0; $i < $n_indices; $i++) {
        push @{$self->{indices}}, $self->{_io}->read_u4le();
    }
}

sub indices {
    my ($self) = @_;
    return $self->{indices};
}

########################################################################
package Gff::GffHeader;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{file_type} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{file_version} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{struct_offset} = $self->{_io}->read_u4le();
    $self->{struct_count} = $self->{_io}->read_u4le();
    $self->{field_offset} = $self->{_io}->read_u4le();
    $self->{field_count} = $self->{_io}->read_u4le();
    $self->{label_offset} = $self->{_io}->read_u4le();
    $self->{label_count} = $self->{_io}->read_u4le();
    $self->{field_data_offset} = $self->{_io}->read_u4le();
    $self->{field_data_count} = $self->{_io}->read_u4le();
    $self->{field_indices_offset} = $self->{_io}->read_u4le();
    $self->{field_indices_count} = $self->{_io}->read_u4le();
    $self->{list_indices_offset} = $self->{_io}->read_u4le();
    $self->{list_indices_count} = $self->{_io}->read_u4le();
}

sub file_type {
    my ($self) = @_;
    return $self->{file_type};
}

sub file_version {
    my ($self) = @_;
    return $self->{file_version};
}

sub struct_offset {
    my ($self) = @_;
    return $self->{struct_offset};
}

sub struct_count {
    my ($self) = @_;
    return $self->{struct_count};
}

sub field_offset {
    my ($self) = @_;
    return $self->{field_offset};
}

sub field_count {
    my ($self) = @_;
    return $self->{field_count};
}

sub label_offset {
    my ($self) = @_;
    return $self->{label_offset};
}

sub label_count {
    my ($self) = @_;
    return $self->{label_count};
}

sub field_data_offset {
    my ($self) = @_;
    return $self->{field_data_offset};
}

sub field_data_count {
    my ($self) = @_;
    return $self->{field_data_count};
}

sub field_indices_offset {
    my ($self) = @_;
    return $self->{field_indices_offset};
}

sub field_indices_count {
    my ($self) = @_;
    return $self->{field_indices_count};
}

sub list_indices_offset {
    my ($self) = @_;
    return $self->{list_indices_offset};
}

sub list_indices_count {
    my ($self) = @_;
    return $self->{list_indices_count};
}

########################################################################
package Gff::LabelArray;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{labels} = [];
    my $n_labels = $self->_root()->header()->label_count();
    for (my $i = 0; $i < $n_labels; $i++) {
        push @{$self->{labels}}, Gff::LabelEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub labels {
    my ($self) = @_;
    return $self->{labels};
}

########################################################################
package Gff::LabelEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{name} = Encode::decode("ASCII", $self->{_io}->read_bytes(16));
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package Gff::ListEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_struct_indices} = $self->{_io}->read_u4le();
    $self->{struct_indices} = [];
    my $n_struct_indices = $self->num_struct_indices();
    for (my $i = 0; $i < $n_struct_indices; $i++) {
        push @{$self->{struct_indices}}, $self->{_io}->read_u4le();
    }
}

sub num_struct_indices {
    my ($self) = @_;
    return $self->{num_struct_indices};
}

sub struct_indices {
    my ($self) = @_;
    return $self->{struct_indices};
}

########################################################################
package Gff::ListIndicesArray;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{raw_data} = $self->{_io}->read_bytes($self->_root()->header()->list_indices_count());
}

sub raw_data {
    my ($self) = @_;
    return $self->{raw_data};
}

########################################################################
package Gff::StructArray;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entries} = [];
    my $n_entries = $self->_root()->header()->struct_count();
    for (my $i = 0; $i < $n_entries; $i++) {
        push @{$self->{entries}}, Gff::StructEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Gff::StructEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{struct_id} = $self->{_io}->read_s4le();
    $self->{data_or_offset} = $self->{_io}->read_u4le();
    $self->{field_count} = $self->{_io}->read_u4le();
}

sub field_indices_offset {
    my ($self) = @_;
    return $self->{field_indices_offset} if ($self->{field_indices_offset});
    if ($self->has_multiple_fields()) {
        $self->{field_indices_offset} = $self->data_or_offset();
    }
    return $self->{field_indices_offset};
}

sub has_multiple_fields {
    my ($self) = @_;
    return $self->{has_multiple_fields} if ($self->{has_multiple_fields});
    $self->{has_multiple_fields} = $self->field_count() > 1;
    return $self->{has_multiple_fields};
}

sub has_single_field {
    my ($self) = @_;
    return $self->{has_single_field} if ($self->{has_single_field});
    $self->{has_single_field} = $self->field_count() == 1;
    return $self->{has_single_field};
}

sub single_field_index {
    my ($self) = @_;
    return $self->{single_field_index} if ($self->{single_field_index});
    if ($self->has_single_field()) {
        $self->{single_field_index} = $self->data_or_offset();
    }
    return $self->{single_field_index};
}

sub struct_id {
    my ($self) = @_;
    return $self->{struct_id};
}

sub data_or_offset {
    my ($self) = @_;
    return $self->{data_or_offset};
}

sub field_count {
    my ($self) = @_;
    return $self->{field_count};
}

1;
