meta:
  id: vis
  title: BioWare VIS (Visibility) File Format
  license: MIT
  endian: le
  file-extension: vis
  encoding: ASCII
  xref:
    pykotor: vendor/PyKotor/Libraries/PyKotor/src/pykotor/resource/formats/vis/
    reone: vendor/reone/src/libs/resource/format/visreader.cpp
    xoreos: vendor/xoreos/src/aurora/visfile.cpp
    kotor_js: vendor/KotOR.js/src/resource/VISObject.ts
    kotor_unity: vendor/KotOR-Unity/Assets/Scripts/FileObjects/VISObject.cs
    wiki: vendor/PyKotor/wiki/VIS-File-Format.md
doc: |
  VIS (Visibility) files describe which module rooms can be seen from other rooms. They drive the
  engine's occlusion culling so that only geometry visible from the player's current room is
  rendered, reducing draw calls and overdraw.

  Format Overview:
  - VIS files are plain ASCII text files
  - Each parent room line lists how many child rooms follow
  - Child room lines are indented by two spaces
  - Empty lines are ignored and names are case-insensitive
  - Files usually ship as moduleXXX.vis pairs
  - The moduleXXXs.vis (or .vis appended inside ERF) uses the same syntax

  File Layout:
  - Parent Lines: "ROOM_NAME CHILD_COUNT"
    - ROOM_NAME: Room label (typically the MDL ResRef of the room)
    - CHILD_COUNT: Number of child lines that follow immediately
  - Child Lines: "  ROOM_NAME" (indented with 2 spaces)
    - Each child line begins with two spaces followed by the visible room name
    - There is no explicit delimiter; the parser trims whitespace
    - A parent can list itself to force always-rendered rooms (rare but valid)
  - Version headers (e.g., "room V3.28") are skipped by parsers
  - Empty lines are ignored

  Example:
  ```
  room012 3
    room013
    room014
    room015
  ```

  Parsing Rules:
  1. Lines are processed sequentially
  2. Empty lines (whitespace only) are ignored
  3. Version header lines (second token starts with "V") are skipped
  4. Parent lines contain room name and child count (e.g., "room012 3")
  5. Child lines are indented with 2 spaces and contain room name
  6. After a parent line, exactly CHILD_COUNT child lines must follow
  7. Room names are case-insensitive (stored lowercase)

  Runtime Behavior:
  - When the player stands in room A, the engine renders any room listed under A and recursively
    any linked lights or effects
  - VIS files only control visibility; collision and pathfinding still rely on walkmeshes (BWM)
    and module GFF data
  - Editing VIS entries is a common optimization: removing unnecessary pairs prevents the renderer
    from drawing walls behind closed doors, while adding entries can fix disappearing geometry
    when doorways are wide open
  - VIS files are NOT required by the game. Most modern hardware can run KotOR significantly well
    even without these defined. The game however does not implement frustum culling, so you may
    want to regardless

  Performance Impact:
  - Without VIS: Engine renders all rooms, even those behind walls/doors (thousands of unnecessary
    polygons)
  - With VIS: Only visible rooms are submitted to the renderer (10-50x fewer draw calls)
  - Overly restrictive VIS: Causes pop-in where rooms suddenly appear when entering adjacent areas
  - Too permissive VIS: Wastes GPU resources rendering unseen geometry

  Common Issues:
  - Missing Room: Room not in any VIS list → never renders → appears invisible
  - One-way Visibility: Room A lists B, but B doesn't list A → asymmetric rendering
  - Performance Problems: All rooms list each other → defeats purpose of VIS optimization
  - Doorway Artifacts: Door rooms not mutually visible → walls clip during door animations

  Module designers balance between performance (fewer visible rooms) and visual quality
  (no pop-in/clipping). Testing VIS changes in-game is essential.

  PyKotor's VIS class stores the data as a dict[str, set[str]], exposing helpers like
  set_visible() and set_all_visible() for tooling.

  References:
  - vendor/PyKotor/wiki/VIS-File-Format.md - Complete VIS format documentation
  - vendor/reone/src/libs/resource/format/visreader.cpp - Complete C++ VIS parser implementation
  - vendor/xoreos/src/aurora/visfile.cpp - Generic Aurora VIS implementation (shared format)
  - vendor/KotOR.js/src/resource/VISObject.ts:71-126 - TypeScript VIS parser with rendering integration
  - vendor/KotOR-Unity/Assets/Scripts/FileObjects/VISObject.cs - C# Unity VIS loader with occlusion culling
  - Libraries/PyKotor/src/pykotor/resource/formats/vis/io_vis.py:14-87 - PyKotor parser implementation
  - Libraries/PyKotor/src/pykotor/resource/formats/vis/vis_data.py:52-294 - VIS data model

seq:
  - id: raw_content
    type: str
    encoding: ASCII
    size-eos: true
    doc: |
      Raw ASCII text content of the entire VIS file.
      The generated C# code parses this text into structured VIS entries
      by splitting on newlines and processing each line according to the
      VIS format specification (parent lines with child counts, indented
      child lines, empty lines, version headers).

      Application code should:
      1. Split raw_content by newlines (\r\n, \n, or \r)
      2. Skip empty lines (whitespace only)
      3. Skip version header lines (second token starts with "V")
      4. Parse parent lines: "ROOM_NAME CHILD_COUNT"
      5. Parse child lines: "  ROOM_NAME" (indented with 2 spaces)
      6. Validate that CHILD_COUNT child lines follow each parent line
      7. Store room names in lowercase for case-insensitive comparison

      See VISAsciiReader.cs for reference implementation matching
      Libraries/PyKotor/src/pykotor/resource/formats/vis/io_vis.py:14-73.
