"""
API functions for Area (ARE) files.
Auto-generated from are.ksy
"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pykotor.common.misc import Game
from pykotor.resource.type import ResourceType

if TYPE_CHECKING:
    from pykotor.resource.type import SOURCE_TYPES, TARGET_TYPES
    from pykotor.resource.generics.are import ARE


def read_are(
    source: SOURCE_TYPES,
    offset: int = 0,
    size: int | None = None,
    file_format: ResourceType | None = None,
) -> ARE:
    """Read ARE from source.
    
    Automatically detects format (binary, XML, JSON) and uses appropriate parser.
    
    Args:
    ----
        source: Source to read from (bytes, file path, or file-like object)
        offset: Byte offset to start reading from
        size: Number of bytes to read (None = read all)
        file_format: Force specific format (None = auto-detect)
        
    Returns:
    -------
        Parsed ARE object
        
    Example:
    -------
        >>> are = read_are("test.are")
        >>> are = read_are("test.are.xml")
        >>> are = read_are(binary_data)
    """
    from pykotor.resource.generics.are import ARE
    from pykotor.resource.formats.gff import read_gff
    
    # Auto-detect format if not specified
    if file_format is None:
        file_format = _detect_format(source)
    
    # Read based on format
    if file_format == ResourceType.GFF:
        # Binary format
        from .io_are import AREBinaryReader
        reader = AREBinaryReader(source, offset, size)
        return reader.load(ARE())
    
    elif file_format == ResourceType.GFF_XML:
        # XML format
        gff = read_gff(source, offset, size, file_format=ResourceType.GFF_XML)
        from .are_data import construct_are
        return construct_are(gff)
    
    elif file_format == ResourceType.GFF_JSON:
        # JSON format
        gff = read_gff(source, offset, size, file_format=ResourceType.GFF_JSON)
        from .are_data import construct_are
        return construct_are(gff)
    
    else:
        raise ValueError(f"Unsupported format: {file_format}")


def write_are(
    are: ARE,
    target: TARGET_TYPES,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Write ARE to target.
    
    Args:
    ----
        are: ARE object to write
        target: Target to write to (file path or file-like object)
        game: Target game version (affects field compatibility)
        file_format: Output format (GFF, GFF_XML, or GFF_JSON)
        
    Returns:
    -------
        Written data as bytes
        
    Example:
    -------
        >>> write_are(are, "output.are")
        >>> write_are(are, "output.are.xml", file_format=ResourceType.GFF_XML)
    """
    from pykotor.resource.formats.gff import write_gff
    
    if file_format == ResourceType.GFF:
        # Binary format
        from .io_are import AREBinaryWriter
        writer = AREBinaryWriter(target)
        return writer.write(are)
    
    elif file_format in (ResourceType.GFF_XML, ResourceType.GFF_JSON):
        # XML/JSON format
        from .are_data import dismantle_are
        gff = dismantle_are(are)
        return write_gff(gff, target, file_format=file_format)
    
    else:
        raise ValueError(f"Unsupported format: {file_format}")


def bytes_are(
    are: ARE,
    game: Game = Game.K2,
    file_format: ResourceType = ResourceType.GFF,
) -> bytes:
    """Convert ARE to bytes in specified format.
    
    Args:
    ----
        are: ARE object to convert
        game: Target game version
        file_format: Output format (GFF, GFF_XML, or GFF_JSON)
        
    Returns:
    -------
        ARE data as bytes
        
    Example:
    -------
        >>> data = bytes_are(are)
        >>> xml_data = bytes_are(are, file_format=ResourceType.GFF_XML)
    """
    from io import BytesIO
    
    buffer = BytesIO()
    write_are(are, buffer, game, file_format)
    return buffer.getvalue()


def _detect_format(source: SOURCE_TYPES) -> ResourceType:
    """Auto-detect format from source.
    
    Args:
    ----
        source: Source to detect format from
        
    Returns:
    -------
        Detected ResourceType
    """
    # Check file extension if source is path
    if isinstance(source, (str, Path)):
        path = Path(source)
        if path.suffix == ".xml":
            return ResourceType.GFF_XML
        elif path.suffix == ".json":
            return ResourceType.GFF_JSON
    
    # Check magic bytes if source is bytes
    if isinstance(source, bytes):
        if source.startswith(b"<"):
            return ResourceType.GFF_XML
        elif source.startswith(b"{"):
            return ResourceType.GFF_JSON
    
    # Default to binary
    return ResourceType.GFF
