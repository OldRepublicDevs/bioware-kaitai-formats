# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package NcsMinimal;

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
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{file_type} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{file_version} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{size_marker} = $self->{_io}->read_u1();
    $self->{total_file_size} = $self->{_io}->read_u4be();
    $self->{instructions} = [];
    {
        my $_it;
        do {
            $_it = NcsMinimal::Instruction->new($self->{_io}, $self, $self->{_root});
            push @{$self->{instructions}}, $_it;
        } until ($self->_io()->pos() >= $self->_root()->total_file_size());
    }
}

sub file_type {
    my ($self) = @_;
    return $self->{file_type};
}

sub file_version {
    my ($self) = @_;
    return $self->{file_version};
}

sub size_marker {
    my ($self) = @_;
    return $self->{size_marker};
}

sub total_file_size {
    my ($self) = @_;
    return $self->{total_file_size};
}

sub instructions {
    my ($self) = @_;
    return $self->{instructions};
}

########################################################################
package NcsMinimal::Instruction;

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

    $self->{bytecode} = $self->{_io}->read_u1();
    $self->{qualifier} = $self->{_io}->read_u1();
}

sub bytecode {
    my ($self) = @_;
    return $self->{bytecode};
}

sub qualifier {
    my ($self) = @_;
    return $self->{qualifier};
}

1;
