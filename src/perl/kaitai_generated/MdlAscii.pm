# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package MdlAscii;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CONTROLLER_TYPE_COMMON_POSITION = 8;
our $CONTROLLER_TYPE_COMMON_ORIENTATION = 20;
our $CONTROLLER_TYPE_COMMON_SCALE = 36;
our $CONTROLLER_TYPE_COMMON_ALPHA = 132;

our $CONTROLLER_TYPE_EMITTER_ALPHA_END = 80;
our $CONTROLLER_TYPE_EMITTER_ALPHA_START = 84;
our $CONTROLLER_TYPE_EMITTER_BIRTHRATE = 88;
our $CONTROLLER_TYPE_EMITTER_BOUNCE_CO = 92;
our $CONTROLLER_TYPE_EMITTER_COMBINETIME = 96;
our $CONTROLLER_TYPE_EMITTER_DRAG = 100;
our $CONTROLLER_TYPE_EMITTER_FPS = 104;
our $CONTROLLER_TYPE_EMITTER_FRAME_END = 108;
our $CONTROLLER_TYPE_EMITTER_FRAME_START = 112;
our $CONTROLLER_TYPE_EMITTER_GRAV = 116;
our $CONTROLLER_TYPE_EMITTER_LIFE_EXP = 120;
our $CONTROLLER_TYPE_EMITTER_MASS = 124;
our $CONTROLLER_TYPE_EMITTER_P2P_BEZIER2 = 128;
our $CONTROLLER_TYPE_EMITTER_P2P_BEZIER3 = 132;
our $CONTROLLER_TYPE_EMITTER_PARTICLE_ROT = 136;
our $CONTROLLER_TYPE_EMITTER_RANDVEL = 140;
our $CONTROLLER_TYPE_EMITTER_SIZE_START = 144;
our $CONTROLLER_TYPE_EMITTER_SIZE_END = 148;
our $CONTROLLER_TYPE_EMITTER_SIZE_START_Y = 152;
our $CONTROLLER_TYPE_EMITTER_SIZE_END_Y = 156;
our $CONTROLLER_TYPE_EMITTER_SPREAD = 160;
our $CONTROLLER_TYPE_EMITTER_THRESHOLD = 164;
our $CONTROLLER_TYPE_EMITTER_VELOCITY = 168;
our $CONTROLLER_TYPE_EMITTER_XSIZE = 172;
our $CONTROLLER_TYPE_EMITTER_YSIZE = 176;
our $CONTROLLER_TYPE_EMITTER_BLURLENGTH = 180;
our $CONTROLLER_TYPE_EMITTER_LIGHTNING_DELAY = 184;
our $CONTROLLER_TYPE_EMITTER_LIGHTNING_RADIUS = 188;
our $CONTROLLER_TYPE_EMITTER_LIGHTNING_SCALE = 192;
our $CONTROLLER_TYPE_EMITTER_LIGHTNING_SUB_DIV = 196;
our $CONTROLLER_TYPE_EMITTER_LIGHTNINGZIGZAG = 200;
our $CONTROLLER_TYPE_EMITTER_ALPHA_MID = 216;
our $CONTROLLER_TYPE_EMITTER_PERCENT_START = 220;
our $CONTROLLER_TYPE_EMITTER_PERCENT_MID = 224;
our $CONTROLLER_TYPE_EMITTER_PERCENT_END = 228;
our $CONTROLLER_TYPE_EMITTER_SIZE_MID = 232;
our $CONTROLLER_TYPE_EMITTER_SIZE_MID_Y = 236;
our $CONTROLLER_TYPE_EMITTER_M_F_RANDOM_BIRTH_RATE = 240;
our $CONTROLLER_TYPE_EMITTER_TARGETSIZE = 252;
our $CONTROLLER_TYPE_EMITTER_NUMCONTROLPTS = 256;
our $CONTROLLER_TYPE_EMITTER_CONTROLPTRADIUS = 260;
our $CONTROLLER_TYPE_EMITTER_CONTROLPTDELAY = 264;
our $CONTROLLER_TYPE_EMITTER_TANGENTSPREAD = 268;
our $CONTROLLER_TYPE_EMITTER_TANGENTLENGTH = 272;
our $CONTROLLER_TYPE_EMITTER_COLOR_MID = 284;
our $CONTROLLER_TYPE_EMITTER_COLOR_END = 380;
our $CONTROLLER_TYPE_EMITTER_COLOR_START = 392;
our $CONTROLLER_TYPE_EMITTER_DETONATE = 502;

our $CONTROLLER_TYPE_LIGHT_COLOR = 76;
our $CONTROLLER_TYPE_LIGHT_RADIUS = 88;
our $CONTROLLER_TYPE_LIGHT_SHADOWRADIUS = 96;
our $CONTROLLER_TYPE_LIGHT_VERTICALDISPLACEMENT = 100;
our $CONTROLLER_TYPE_LIGHT_MULTIPLIER = 140;

our $CONTROLLER_TYPE_MESH_SELFILLUMCOLOR = 100;

our $MODEL_CLASSIFICATION_OTHER = 0;
our $MODEL_CLASSIFICATION_EFFECT = 1;
our $MODEL_CLASSIFICATION_TILE = 2;
our $MODEL_CLASSIFICATION_CHARACTER = 4;
our $MODEL_CLASSIFICATION_DOOR = 8;
our $MODEL_CLASSIFICATION_LIGHTSABER = 16;
our $MODEL_CLASSIFICATION_PLACEABLE = 32;
our $MODEL_CLASSIFICATION_FLYER = 64;

our $NODE_TYPE_DUMMY = 1;
our $NODE_TYPE_LIGHT = 3;
our $NODE_TYPE_EMITTER = 5;
our $NODE_TYPE_REFERENCE = 17;
our $NODE_TYPE_TRIMESH = 33;
our $NODE_TYPE_SKINMESH = 97;
our $NODE_TYPE_ANIMMESH = 161;
our $NODE_TYPE_DANGLYMESH = 289;
our $NODE_TYPE_AABB = 545;
our $NODE_TYPE_LIGHTSABER = 2081;

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

    $self->{lines} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{lines}}, MdlAscii::AsciiLine->new($self->{_io}, $self, $self->{_root});
    }
}

sub lines {
    my ($self) = @_;
    return $self->{lines};
}

########################################################################
package MdlAscii::AnimationSection;

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

    $self->{newanim} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{doneanim} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{length} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{transtime} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{animroot} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{event} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{eventlist} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{endlist} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
}

sub newanim {
    my ($self) = @_;
    return $self->{newanim};
}

sub doneanim {
    my ($self) = @_;
    return $self->{doneanim};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub transtime {
    my ($self) = @_;
    return $self->{transtime};
}

sub animroot {
    my ($self) = @_;
    return $self->{animroot};
}

sub event {
    my ($self) = @_;
    return $self->{event};
}

sub eventlist {
    my ($self) = @_;
    return $self->{eventlist};
}

sub endlist {
    my ($self) = @_;
    return $self->{endlist};
}

########################################################################
package MdlAscii::AsciiLine;

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

    $self->{content} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(10, 0, 1, 0));
}

sub content {
    my ($self) = @_;
    return $self->{content};
}

########################################################################
package MdlAscii::ControllerBezier;

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

    $self->{controller_name} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{keyframes} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{keyframes}}, MdlAscii::ControllerBezierKeyframe->new($self->{_io}, $self, $self->{_root});
    }
}

sub controller_name {
    my ($self) = @_;
    return $self->{controller_name};
}

sub keyframes {
    my ($self) = @_;
    return $self->{keyframes};
}

########################################################################
package MdlAscii::ControllerBezierKeyframe;

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

    $self->{time} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
    $self->{value_data} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub time {
    my ($self) = @_;
    return $self->{time};
}

sub value_data {
    my ($self) = @_;
    return $self->{value_data};
}

########################################################################
package MdlAscii::ControllerKeyed;

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

    $self->{controller_name} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{keyframes} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{keyframes}}, MdlAscii::ControllerKeyframe->new($self->{_io}, $self, $self->{_root});
    }
}

sub controller_name {
    my ($self) = @_;
    return $self->{controller_name};
}

sub keyframes {
    my ($self) = @_;
    return $self->{keyframes};
}

########################################################################
package MdlAscii::ControllerKeyframe;

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

    $self->{time} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
    $self->{values} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub time {
    my ($self) = @_;
    return $self->{time};
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package MdlAscii::ControllerSingle;

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

    $self->{controller_name} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{values} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
}

sub controller_name {
    my ($self) = @_;
    return $self->{controller_name};
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package MdlAscii::DanglymeshProperties;

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

    $self->{displacement} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{tightness} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{period} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
}

sub displacement {
    my ($self) = @_;
    return $self->{displacement};
}

sub tightness {
    my ($self) = @_;
    return $self->{tightness};
}

sub period {
    my ($self) = @_;
    return $self->{period};
}

########################################################################
package MdlAscii::DataArrays;

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

    $self->{verts} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{faces} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{tverts} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{tverts1} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{lightmaptverts} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{tverts2} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{tverts3} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{texindices1} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{texindices2} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{texindices3} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{colors} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{colorindices} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{weights} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{constraints} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{aabb} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{saber_verts} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{saber_norms} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{name} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
}

sub verts {
    my ($self) = @_;
    return $self->{verts};
}

sub faces {
    my ($self) = @_;
    return $self->{faces};
}

sub tverts {
    my ($self) = @_;
    return $self->{tverts};
}

sub tverts1 {
    my ($self) = @_;
    return $self->{tverts1};
}

sub lightmaptverts {
    my ($self) = @_;
    return $self->{lightmaptverts};
}

sub tverts2 {
    my ($self) = @_;
    return $self->{tverts2};
}

sub tverts3 {
    my ($self) = @_;
    return $self->{tverts3};
}

sub texindices1 {
    my ($self) = @_;
    return $self->{texindices1};
}

sub texindices2 {
    my ($self) = @_;
    return $self->{texindices2};
}

sub texindices3 {
    my ($self) = @_;
    return $self->{texindices3};
}

sub colors {
    my ($self) = @_;
    return $self->{colors};
}

sub colorindices {
    my ($self) = @_;
    return $self->{colorindices};
}

sub weights {
    my ($self) = @_;
    return $self->{weights};
}

sub constraints {
    my ($self) = @_;
    return $self->{constraints};
}

sub aabb {
    my ($self) = @_;
    return $self->{aabb};
}

sub saber_verts {
    my ($self) = @_;
    return $self->{saber_verts};
}

sub saber_norms {
    my ($self) = @_;
    return $self->{saber_norms};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package MdlAscii::EmitterFlags;

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

    $self->{p2p} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{p2p_sel} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{affected_by_wind} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{m_is_tinted} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{bounce} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{random} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{inherit} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{inheritvel} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{inherit_local} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{splat} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{inherit_part} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{depth_texture} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{emitterflag13} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
}

sub p2p {
    my ($self) = @_;
    return $self->{p2p};
}

sub p2p_sel {
    my ($self) = @_;
    return $self->{p2p_sel};
}

sub affected_by_wind {
    my ($self) = @_;
    return $self->{affected_by_wind};
}

sub m_is_tinted {
    my ($self) = @_;
    return $self->{m_is_tinted};
}

sub bounce {
    my ($self) = @_;
    return $self->{bounce};
}

sub random {
    my ($self) = @_;
    return $self->{random};
}

sub inherit {
    my ($self) = @_;
    return $self->{inherit};
}

sub inheritvel {
    my ($self) = @_;
    return $self->{inheritvel};
}

sub inherit_local {
    my ($self) = @_;
    return $self->{inherit_local};
}

sub splat {
    my ($self) = @_;
    return $self->{splat};
}

sub inherit_part {
    my ($self) = @_;
    return $self->{inherit_part};
}

sub depth_texture {
    my ($self) = @_;
    return $self->{depth_texture};
}

sub emitterflag13 {
    my ($self) = @_;
    return $self->{emitterflag13};
}

########################################################################
package MdlAscii::EmitterProperties;

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

    $self->{deadspace} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{blast_radius} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{blast_length} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{num_branches} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{controlptsmoothing} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{xgrid} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{ygrid} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{spawntype} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{update} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{render} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{blend} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{texture} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{chunkname} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{twosidedtex} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{loop} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{renderorder} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{m_b_frame_blending} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{m_s_depth_texture_name} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
}

sub deadspace {
    my ($self) = @_;
    return $self->{deadspace};
}

sub blast_radius {
    my ($self) = @_;
    return $self->{blast_radius};
}

sub blast_length {
    my ($self) = @_;
    return $self->{blast_length};
}

sub num_branches {
    my ($self) = @_;
    return $self->{num_branches};
}

sub controlptsmoothing {
    my ($self) = @_;
    return $self->{controlptsmoothing};
}

sub xgrid {
    my ($self) = @_;
    return $self->{xgrid};
}

sub ygrid {
    my ($self) = @_;
    return $self->{ygrid};
}

sub spawntype {
    my ($self) = @_;
    return $self->{spawntype};
}

sub update {
    my ($self) = @_;
    return $self->{update};
}

sub render {
    my ($self) = @_;
    return $self->{render};
}

sub blend {
    my ($self) = @_;
    return $self->{blend};
}

sub texture {
    my ($self) = @_;
    return $self->{texture};
}

sub chunkname {
    my ($self) = @_;
    return $self->{chunkname};
}

sub twosidedtex {
    my ($self) = @_;
    return $self->{twosidedtex};
}

sub loop {
    my ($self) = @_;
    return $self->{loop};
}

sub renderorder {
    my ($self) = @_;
    return $self->{renderorder};
}

sub m_b_frame_blending {
    my ($self) = @_;
    return $self->{m_b_frame_blending};
}

sub m_s_depth_texture_name {
    my ($self) = @_;
    return $self->{m_s_depth_texture_name};
}

########################################################################
package MdlAscii::LightProperties;

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

    $self->{flareradius} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{flarepositions} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{flaresizes} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{flarecolorshifts} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{texturenames} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{ambientonly} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{ndynamictype} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{affectdynamic} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{flare} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{lightpriority} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{fadinglight} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
}

sub flareradius {
    my ($self) = @_;
    return $self->{flareradius};
}

sub flarepositions {
    my ($self) = @_;
    return $self->{flarepositions};
}

sub flaresizes {
    my ($self) = @_;
    return $self->{flaresizes};
}

sub flarecolorshifts {
    my ($self) = @_;
    return $self->{flarecolorshifts};
}

sub texturenames {
    my ($self) = @_;
    return $self->{texturenames};
}

sub ambientonly {
    my ($self) = @_;
    return $self->{ambientonly};
}

sub ndynamictype {
    my ($self) = @_;
    return $self->{ndynamictype};
}

sub affectdynamic {
    my ($self) = @_;
    return $self->{affectdynamic};
}

sub flare {
    my ($self) = @_;
    return $self->{flare};
}

sub lightpriority {
    my ($self) = @_;
    return $self->{lightpriority};
}

sub fadinglight {
    my ($self) = @_;
    return $self->{fadinglight};
}

########################################################################
package MdlAscii::LineText;

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

    $self->{value} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(10, 0, 1, 0));
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package MdlAscii::ReferenceProperties;

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

    $self->{refmodel} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
    $self->{reattachable} = MdlAscii::LineText->new($self->{_io}, $self, $self->{_root});
}

sub refmodel {
    my ($self) = @_;
    return $self->{refmodel};
}

sub reattachable {
    my ($self) = @_;
    return $self->{reattachable};
}

1;
