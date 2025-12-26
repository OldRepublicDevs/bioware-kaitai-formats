# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Gff;

########################################################################
package Ute;

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

    $self->{gff_data} = Gff->new($self->{_io});
}

sub file_type_valid {
    my ($self) = @_;
    return $self->{file_type_valid} if ($self->{file_type_valid});
    $self->{file_type_valid} = $self->gff_data()->header()->file_type() eq "UTE ";
    return $self->{file_type_valid};
}

sub version_valid {
    my ($self) = @_;
    return $self->{version_valid} if ($self->{version_valid});
    $self->{version_valid} =  (($self->gff_data()->header()->file_version() eq "V3.2") || ($self->gff_data()->header()->file_version() eq "V3.3")) ;
    return $self->{version_valid};
}

sub gff_data {
    my ($self) = @_;
    return $self->{gff_data};
}

1;
