meta:
  id: bioware_extract_common
  title: BioWare Extraction/Search Enums (reference-derived)
  license: MIT
  endian: le
  xref:
    pykotor_ref: vendor/PyKotor/Libraries/PyKotor/src/pykotor/extract/installation.py
doc: |
  Enums and small helper types used by installation/extraction tooling.

  References:
  - vendor/PyKotor/Libraries/PyKotor/src/pykotor/extract/installation.py

types:
  bioware_texture_pack_name_str:
    doc: String-valued enum equivalent for TexturePackNames (null-terminated ASCII filename).
    seq:
      - id: value
        type: str
        encoding: ASCII
        terminator: 0
        valid:
          any-of:
            - "'swpc_tex_tpa.erf'"
            - "'swpc_tex_tpb.erf'"
            - "'swpc_tex_tpc.erf'"
            - "'swpc_tex_gui.erf'"

enums:
  # Extracted from `pykotor.extract.installation.SearchLocation` (IntEnum)
  bioware_search_location_id:
    0: override
    1: modules
    2: chitin
    3: textures_tpa
    4: textures_tpb
    5: textures_tpc
    6: textures_gui
    7: music
    8: sound
    9: voice
    10: lips
    11: rims
    12: custom_modules
    13: custom_folders


