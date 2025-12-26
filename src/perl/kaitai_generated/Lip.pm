# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Lip;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $LIP_SHAPES_NEUTRAL = 0;
our $LIP_SHAPES_EE = 1;
our $LIP_SHAPES_EH = 2;
our $LIP_SHAPES_AH = 3;
our $LIP_SHAPES_OH = 4;
our $LIP_SHAPES_OOH = 5;
our $LIP_SHAPES_Y = 6;
our $LIP_SHAPES_STS = 7;
our $LIP_SHAPES_FV = 8;
our $LIP_SHAPES_NG = 9;
our $LIP_SHAPES_TH = 10;
our $LIP_SHAPES_MPB = 11;
our $LIP_SHAPES_TD = 12;
our $LIP_SHAPES_SH = 13;
our $LIP_SHAPES_L = 14;
our $LIP_SHAPES_KG = 15;

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
    $self->{length} = $self->{_io}->read_f4le();
    $self->{num_keyframes} = $self->{_io}->read_u4le();
    $self->{keyframes} = [];
    my $n_keyframes = $self->num_keyframes();
    for (my $i = 0; $i < $n_keyframes; $i++) {
        push @{$self->{keyframes}}, Lip::KeyframeEntry->new($self->{_io}, $self, $self->{_root});
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

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub num_keyframes {
    my ($self) = @_;
    return $self->{num_keyframes};
}

sub keyframes {
    my ($self) = @_;
    return $self->{keyframes};
}

########################################################################
package Lip::KeyframeEntry;

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

    $self->{timestamp} = $self->{_io}->read_f4le();
    $self->{shape} = $self->{_io}->read_u1();
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub shape {
    my ($self) = @_;
    return $self->{shape};
}

1;
