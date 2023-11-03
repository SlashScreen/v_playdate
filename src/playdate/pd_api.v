[translated]
module playdate

type Uintptr_t = i64
type Va_list = &i8
type Size_t = i64
type Ptrdiff_t = i64
type Intptr_t = i64
type Wchar_t = u16
type Int8_t = i8
type Int16_t = i16
type Int32_t = int
type Int64_t = i64
type Uint8_t = u8
type Uint16_t = u16
type Uint32_t = u32
type Uint64_t = i64
type Int_least8_t = i8
type Int_least16_t = i16
type Int_least32_t = int
type Int_least64_t = i64
type Uint_least8_t = u8
type Uint_least16_t = u16
type Uint_least32_t = u32
type Uint_least64_t = i64
type Int_fast8_t = i8
type Int_fast16_t = int
type Int_fast32_t = int
type Int_fast64_t = i64
type Uint_fast8_t = u8
type Uint_fast16_t = u32
type Uint_fast32_t = u32
type Uint_fast64_t = i64
type Intmax_t = i64
type Uintmax_t = i64
type Errno_t = int
type Wint_t = u16
type Wctype_t = u16
struct Crt_locale_data_public { 
	_locale_pctype &u16
	_locale_mb_cur_max int
	_locale_lc_codepage u32
}
struct Crt_locale_pointers { 
	locinfo &crt_locale_data
	mbcinfo &crt_multibyte_data
}
type _locale_t = &crt_locale_pointers
struct Mbstatet { 
	_Wchar u32
	_Byte u16
	_State u16
}
type Mbstate_t = Mbstatet
type Time_t = Time64_t
type Rsize_t = usize
type Max_align_t = f64
type _CoreCrtSecureSearchSortCompareFunction = fn (voidptr, voidptr, voidptr) int
type _CoreCrtNonSecureSearchSortCompareFunction = fn (voidptr, voidptr) int
type _onexit_t = fn () int
type _purecall_handler = fn ()
type _invalid_parameter_handler = fn (&Wchar_t, &Wchar_t, &Wchar_t, u32, Uintptr_t)
struct Div_t { 
	quot int
	rem int
}
struct Lldiv_t { 
	quot i64
	rem i64
}
struct LDOUBLE { 
	ld [10]u8
}
struct CRT_DOUBLE { 
	x f64
}
struct CRT_FLOAT { 
	f f32
}
struct LONGDOUBLE { 
	x f64
}
struct LDBL12 { 
	ld12 [12]u8
}
fn C.system(_command &i8) int

pub fn system(_command &i8) int {
	return C.system(_command)
}

struct LCDRect { 
	left int
	right int
	top int
	bottom int
}
enum LCDBitmapDrawMode {
	kdrawmodecopy
	kdrawmodewhitetransparent
	kdrawmodeblacktransparent
	kdrawmodefillwhite
	kdrawmodefillblack
	kdrawmodexor
	kdrawmodenxor
	kdrawmodeinverted
}

enum LCDBitmapFlip {
	kbitmapunflipped
	kbitmapflippedx
	kbitmapflippedy
	kbitmapflippedxy
}

enum LCDSolidColor {
	kcolorblack
	kcolorwhite
	kcolorclear
	kcolorxor
}

enum LCDLineCapStyle {
	klinecapstylebutt
	klinecapstylesquare
	klinecapstyleround
}

enum LCDFontLanguage {
	klcdfontlanguageenglish
	klcdfontlanguagejapanese
	klcdfontlanguageunknown
}

enum PDStringEncoding {
	kasciiencoding
	kutf8encoding
	k16bitleencoding
}

type LCDPattern = [16]u8
type LCDColor = Uintptr_t
enum LCDPolygonFillRule {
	kpolygonfillnonzero
	kpolygonfillevenodd
}

struct Playdate_video { 
	loadVideo fn (&i8) &LCDVideoPlayer
	freePlayer fn (&LCDVideoPlayer)
	setContext fn (&LCDVideoPlayer, &LCDBitmap) int
	useScreenContext fn (&LCDVideoPlayer)
	renderFrame fn (&LCDVideoPlayer, int) int
	getError fn (&LCDVideoPlayer) &i8
	getInfo fn (&LCDVideoPlayer, &int, &int, &f32, &int, &int)
	getContext fn (&LCDVideoPlayer) &LCDBitmap
}
struct Playdate_graphics { 
	video &Playdate_video
	clear fn (LCDColor)
	setBackgroundColor fn (LCDSolidColor)
	setStencil fn (&LCDBitmap)
	setDrawMode fn (LCDBitmapDrawMode)
	setDrawOffset fn (int, int)
	setClipRect fn (int, int, int, int)
	clearClipRect fn ()
	setLineCapStyle fn (LCDLineCapStyle)
	setFont fn (&LCDFont)
	setTextTracking fn (int)
	pushContext fn (&LCDBitmap)
	popContext fn ()
	drawBitmap fn (&LCDBitmap, int, int, LCDBitmapFlip)
	tileBitmap fn (&LCDBitmap, int, int, int, int, LCDBitmapFlip)
	drawLine fn (int, int, int, int, int, LCDColor)
	fillTriangle fn (int, int, int, int, int, int, LCDColor)
	drawRect fn (int, int, int, int, LCDColor)
	fillRect fn (int, int, int, int, LCDColor)
	drawEllipse fn (int, int, int, int, int, f32, f32, LCDColor)
	fillEllipse fn (int, int, int, int, f32, f32, LCDColor)
	drawScaledBitmap fn (&LCDBitmap, int, int, f32, f32)
	drawText fn (voidptr, usize, PDStringEncoding, int, int) int
	newBitmap fn (int, int, LCDColor) &LCDBitmap
	freeBitmap fn (&LCDBitmap)
	loadBitmap fn (&i8, &&i8) &LCDBitmap
	copyBitmap fn (&LCDBitmap) &LCDBitmap
	loadIntoBitmap fn (&i8, &LCDBitmap, &&i8)
	getBitmapData fn (&LCDBitmap, &int, &int, &int, &&u8, &&u8)
	clearBitmap fn (&LCDBitmap, LCDColor)
	rotatedBitmap fn (&LCDBitmap, f32, f32, f32, &int) &LCDBitmap
	newBitmapTable fn (int, int, int) &LCDBitmapTable
	freeBitmapTable fn (&LCDBitmapTable)
	loadBitmapTable fn (&i8, &&i8) &LCDBitmapTable
	loadIntoBitmapTable fn (&i8, &LCDBitmapTable, &&i8)
	getTableBitmap fn (&LCDBitmapTable, int) &LCDBitmap
	loadFont fn (&i8, &&i8) &LCDFont
	getFontPage fn (&LCDFont, u32) &LCDFontPage
	getPageGlyph fn (&LCDFontPage, u32, &&LCDBitmap, &int) &LCDFontGlyph
	getGlyphKerning fn (&LCDFontGlyph, u32, u32) int
	getTextWidth fn (&LCDFont, voidptr, usize, PDStringEncoding, int) int
	getFrame fn () &u8
	getDisplayFrame fn () &u8
	getDebugBitmap fn () &LCDBitmap
	copyFrameBufferBitmap fn () &LCDBitmap
	markUpdatedRows fn (int, int)
	display fn ()
	setColorToPattern fn (&LCDColor, &LCDBitmap, int, int)
	checkMaskCollision fn (&LCDBitmap, int, int, LCDBitmapFlip, &LCDBitmap, int, int, LCDBitmapFlip, LCDRect) int
	setScreenClipRect fn (int, int, int, int)
	fillPolygon fn (int, &int, LCDColor, LCDPolygonFillRule)
	getFontHeight fn (&LCDFont) u8
	getDisplayBufferBitmap fn () &LCDBitmap
	drawRotatedBitmap fn (&LCDBitmap, int, int, f32, f32, f32, f32, f32)
	setTextLeading fn (int)
	setBitmapMask fn (&LCDBitmap, &LCDBitmap) int
	getBitmapMask fn (&LCDBitmap) &LCDBitmap
	setStencilImage fn (&LCDBitmap, int)
	makeFontFromData fn (&LCDFontData, int) &LCDFont
	getTextTracking fn () int
}
enum PDButtons {
	kbuttonleft = 1 << 0
	kbuttonright = 1 << 1
	kbuttonup = 1 << 2
	kbuttondown = 1 << 3
	kbuttonb = 1 << 4
	kbuttona = 1 << 5
}

enum PDLanguage {
	kpdlanguageenglish
	kpdlanguagejapanese
	kpdlanguageunknown
}

struct PDDateTime { 
	year u16
	month u8
	day u8
	weekday u8
	hour u8
	minute u8
	second u8
}
enum PDPeripherals {
	knone = 0
	kaccelerometer = 1 << 0
	kallperipherals = 65535
}

type PDCallbackFunction = Int (void *)
type PDMenuItemCallbackFunction = Void (void *)
struct Lua_State { 
	realloc fn (voidptr, usize) voidptr
	formatString fn (&&u8, &i8, ...) int
	logToConsole fn (&i8, ...)
	error fn (&i8, ...)
	getLanguage fn () PDLanguage
	getCurrentTimeMilliseconds fn () u32
	getSecondsSinceEpoch fn (&u32) u32
	drawFPS fn (int, int)
	setUpdateCallback fn (&PDCallbackFunction, voidptr)
	getButtonState fn (&PDButtons, &PDButtons, &PDButtons)
	setPeripheralsEnabled fn (PDPeripherals)
	getAccelerometer fn (&f32, &f32, &f32)
	getCrankChange fn () f32
	getCrankAngle fn () f32
	isCrankDocked fn () int
	setCrankSoundsDisabled fn (int) int
	getFlipped fn () int
	setAutoLockDisabled fn (int)
	setMenuImage fn (&LCDBitmap, int)
	addMenuItem fn (&i8, &PDMenuItemCallbackFunction, voidptr) &PDMenuItem
	addCheckmarkMenuItem fn (&i8, int, &PDMenuItemCallbackFunction, voidptr) &PDMenuItem
	addOptionsMenuItem fn (&i8, &&i8, int, &PDMenuItemCallbackFunction, voidptr) &PDMenuItem
	removeAllMenuItems fn ()
	removeMenuItem fn (&PDMenuItem)
	getMenuItemValue fn (&PDMenuItem) int
	setMenuItemValue fn (&PDMenuItem, int)
	getMenuItemTitle fn (&PDMenuItem) &i8
	setMenuItemTitle fn (&PDMenuItem, &i8)
	getMenuItemUserdata fn (&PDMenuItem) voidptr
	setMenuItemUserdata fn (&PDMenuItem, voidptr)
	getReduceFlashing fn () int
	getElapsedTime fn () f32
	resetElapsedTime fn ()
	getBatteryPercentage fn () f32
	getBatteryVoltage fn () f32
	getTimezoneOffset fn () int
	shouldDisplay24HourTime fn () int
	convertEpochToDateTime fn (u32, &PDDateTime)
	convertDateTimeToEpoch fn (&PDDateTime) u32
	clearICache fn ()
}
type Lua_CFunction = fn (&Lua_State) int
enum L_valtype {
	kint
	kfloat
	kstr
}

struct Lua_reg { 
	name &i8
	func Lua_CFunction
}
enum LuaType {
	ktypenil
	ktypebool
	ktypeint
	ktypefloat
	ktypestring
	ktypetable
	ktypefunction
	ktypethread
	ktypeobject
}

struct Lua_val { 
	name &i8
	type_ L_valtype
	v Union 
}
struct Playdate_lua { 
	addFunction fn (Lua_CFunction, &i8, &&i8) int
	registerClass fn (&i8, &Lua_reg, &Lua_val, int, &&i8) int
	pushFunction fn (Lua_CFunction)
	indexMetatable fn () int
	stop fn ()
	start fn ()
	getArgCount fn () int
	getArgType LuaType (*)(int, char **)
	argIsNil fn (int) int
	getArgBool fn (int) int
	getArgInt fn (int) int
	getArgFloat fn (int) f32
	getArgString fn (int) &i8
	getArgBytes fn (int, &usize) &i8
	getArgObject fn (int, &i8, &&LuaUDObject) voidptr
	getBitmap fn (int) &LCDBitmap
	getSprite fn (int) &LCDSprite
	pushNil fn ()
	pushBool fn (int)
	pushInt fn (int)
	pushFloat fn (f32)
	pushString fn (&i8)
	pushBytes fn (&i8, usize)
	pushBitmap fn (&LCDBitmap)
	pushSprite fn (&LCDSprite)
	pushObject fn (voidptr, &i8, int) &LuaUDObject
	retainObject fn (&LuaUDObject) &LuaUDObject
	releaseObject fn (&LuaUDObject)
	setUserValue fn (&LuaUDObject, u32)
	getUserValue fn (&LuaUDObject, u32) int
	callFunction_deprecated fn (&i8, int)
	callFunction fn (&i8, int, &&i8) int
}
enum Json_value_type {
	kjsonnull
	kjsontrue
	kjsonfalse
	kjsoninteger
	kjsonfloat
	kjsonstring
	kjsonarray
	kjsontable
}

struct Json_value { 
	type_ i8
	data Union (unnamed union at J
}
struct Json_reader { 
	c.read fn (voidptr, &u8, int) int
	userdata voidptr
}
type WriteFunc = Void (void *, char *, int)
struct Json_encoder { 
	writeStringFunc &WriteFunc
	userdata voidptr
	pretty int
	startedTable int
	startedArray int
	depth int
	startArray fn (&Json_encoder)
	addArrayMember fn (&Json_encoder)
	endArray fn (&Json_encoder)
	startTable fn (&Json_encoder)
	addTableMember fn (&Json_encoder, &i8, int)
	endTable fn (&Json_encoder)
	writeNull fn (&Json_encoder)
	writeFalse fn (&Json_encoder)
	writeTrue fn (&Json_encoder)
	writeInt fn (&Json_encoder, int)
	writeDouble fn (&Json_encoder, f64)
	writeString fn (&Json_encoder, &i8, int)
}
struct SDFile { 
	initEncoder fn (&Json_encoder, &WriteFunc, voidptr, int)
	decode fn (&Json_decoder, Json_reader, &Json_value) int
	decodeString fn (&Json_decoder, &i8, &Json_value) int
}
enum FileOptions {
	kfileread = 1 << 0
	kfilereaddata = 1 << 1
	kfilewrite = 1 << 2
	kfileappend = 2 << 2
}

struct FileStat { 
	isdir int
	size u32
	m_year int
	m_month int
	m_day int
	m_hour int
	m_minute int
	m_second int
}
struct Playdate_file { 
	geterr fn () &i8
	listfiles fn (&i8, &Void  (char, voidptr) int
	stat fn (&i8, &FileStat) int
	mkdir fn (&i8) int
	unlink fn (&i8, int) int
	c.rename fn (&i8, &i8) int
	c.open fn (&i8, FileOptions) &SDFile
	c.close fn (&SDFile) int
	c.read fn (&SDFile, voidptr, u32) int
	c.write fn (&SDFile, voidptr, u32) int
	flush fn (&SDFile) int
	tell fn (&SDFile) int
	seek fn (&SDFile, int, int) int
}
enum SpriteCollisionResponseType {
	kcollisiontypeslide
	kcollisiontypefreeze
	kcollisiontypeoverlap
	kcollisiontypebounce
}

struct PDRect { 
	x f32
	y f32
	width f32
	height f32
}
struct CollisionPoint { 
	x f32
	y f32
}
struct CollisionVector { 
	x int
	y int
}
type LCDSpriteDrawFunction = Void (LCDSprite *, PDRect, PDRect)
type LCDSpriteUpdateFunction = Void (LCDSprite *)
type LCDSpriteCollisionFilterProc = SpriteCollisionResponseType (LCDSprite *, LCDSprite *)
struct Playdate_sprite { 
	setAlwaysRedraw fn (int)
	addDirtyRect fn (LCDRect)
	drawSprites fn ()
	updateAndDrawSprites fn ()
	newSprite fn () &LCDSprite
	freeSprite fn (&LCDSprite)
	copy fn (&LCDSprite) &LCDSprite
	addSprite fn (&LCDSprite)
	removeSprite fn (&LCDSprite)
	removeSprites fn (&&LCDSprite, int)
	removeAllSprites fn ()
	getSpriteCount fn () int
	setBounds fn (&LCDSprite, PDRect)
	getBounds fn (&LCDSprite) PDRect
	moveTo fn (&LCDSprite, f32, f32)
	moveBy fn (&LCDSprite, f32, f32)
	setImage fn (&LCDSprite, &LCDBitmap, LCDBitmapFlip)
	getImage fn (&LCDSprite) &LCDBitmap
	setSize fn (&LCDSprite, f32, f32)
	setZIndex fn (&LCDSprite, i16)
	getZIndex fn (&LCDSprite) i16
	setDrawMode fn (&LCDSprite, LCDBitmapDrawMode)
	setImageFlip fn (&LCDSprite, LCDBitmapFlip)
	getImageFlip fn (&LCDSprite) LCDBitmapFlip
	setStencil fn (&LCDSprite, &LCDBitmap)
	setClipRect fn (&LCDSprite, LCDRect)
	clearClipRect fn (&LCDSprite)
	setClipRectsInRange fn (LCDRect, int, int)
	clearClipRectsInRange fn (int, int)
	setUpdatesEnabled fn (&LCDSprite, int)
	updatesEnabled fn (&LCDSprite) int
	setCollisionsEnabled fn (&LCDSprite, int)
	collisionsEnabled fn (&LCDSprite) int
	setVisible fn (&LCDSprite, int)
	isVisible fn (&LCDSprite) int
	setOpaque fn (&LCDSprite, int)
	markDirty fn (&LCDSprite)
	setTag fn (&LCDSprite, u8)
	getTag fn (&LCDSprite) u8
	setIgnoresDrawOffset fn (&LCDSprite, int)
	setUpdateFunction fn (&LCDSprite, &LCDSpriteUpdateFunction)
	setDrawFunction fn (&LCDSprite, &LCDSpriteDrawFunction)
	getPosition fn (&LCDSprite, &f32, &f32)
	resetCollisionWorld fn ()
	setCollideRect fn (&LCDSprite, PDRect)
	getCollideRect fn (&LCDSprite) PDRect
	clearCollideRect fn (&LCDSprite)
	setCollisionResponseFunction fn (&LCDSprite, &LCDSpriteCollisionFilterProc)
	checkCollisions fn (&LCDSprite, f32, f32, &f32, &f32, &int) &SpriteCollisionInfo
	moveWithCollisions fn (&LCDSprite, f32, f32, &f32, &f32, &int) &SpriteCollisionInfo
	querySpritesAtPoint fn (f32, f32, &int) &&LCDSprite
	querySpritesInRect fn (f32, f32, f32, f32, &int) &&LCDSprite
	querySpritesAlongLine fn (f32, f32, f32, f32, &int) &&LCDSprite
	querySpriteInfoAlongLine fn (f32, f32, f32, f32, &int) &SpriteQueryInfo
	overlappingSprites fn (&LCDSprite, &int) &&LCDSprite
	allOverlappingSprites fn (&int) &&LCDSprite
	setStencilPattern fn (&LCDSprite, &u8)
	clearStencil fn (&LCDSprite)
	setUserdata fn (&LCDSprite, voidptr)
	getUserdata fn (&LCDSprite) voidptr
	setStencilImage fn (&LCDSprite, &LCDBitmap, int)
	setCenter fn (&LCDSprite, f32, f32)
	getCenter fn (&LCDSprite, &f32, &f32)
}
enum SoundFormat {
	ksound8bitmono = 0
	ksound8bitstereo = 1
	ksound16bitmono = 2
	ksound16bitstereo = 3
	ksoundadpcmmono = 4
	ksoundadpcmstereo = 5
}

type MIDINote = f32
struct Exception { 
	type_ int
	name &i8
	arg1 f64
	arg2 f64
	retval f64
}
struct Float_t { 
	x f64
	y f64
}
union Double_val { 
	_Sh [4]u16
	_Val f64
}
union Float_val { 
	_Sh [2]u16
	_Val f32
}
union Ldouble_val { 
	_Sh [4]u16
	_Val f64
}
union Float_const { 
	_Word [4]u16
	_Float f32
	_Double f64
	_Long_double f64
}
fn C.exp( f64) f64

pub fn exp( f64) f64 {
	return C.exp(f64)
}

type SndCallbackProc = Void (SoundSource *)
struct Playdate_sound_source { 
	setVolume fn (&SoundSource, f32, f32)
	getVolume fn (&SoundSource, &f32, &f32)
	isPlaying fn (&SoundSource) int
	setFinishCallback fn (&SoundSource, &SndCallbackProc)
}
struct Playdate_sound_fileplayer { 
	newPlayer fn () &FilePlayer
	freePlayer fn (&FilePlayer)
	loadIntoPlayer fn (&FilePlayer, &i8) int
	setBufferLength fn (&FilePlayer, f32)
	play fn (&FilePlayer, int) int
	isPlaying fn (&FilePlayer) int
	pause fn (&FilePlayer)
	stop fn (&FilePlayer)
	setVolume fn (&FilePlayer, f32, f32)
	getVolume fn (&FilePlayer, &f32, &f32)
	getLength fn (&FilePlayer) f32
	setOffset fn (&FilePlayer, f32)
	setRate fn (&FilePlayer, f32)
	setLoopRange fn (&FilePlayer, f32, f32)
	didUnderrun fn (&FilePlayer) int
	setFinishCallback fn (&FilePlayer, &SndCallbackProc)
	setLoopCallback fn (&FilePlayer, &SndCallbackProc)
	getOffset fn (&FilePlayer) f32
	getRate fn (&FilePlayer) f32
	setStopOnUnderrun fn (&FilePlayer, int)
	fadeVolume fn (&FilePlayer, f32, f32, int, &SndCallbackProc)
	setMP3StreamSource fn (&FilePlayer, &Int  (uint8_t, int, voidptr)
}
struct Playdate_sound_sample { 
	newSampleBuffer fn (int) &AudioSample
	loadIntoSample fn (&AudioSample, &i8) int
	load fn (&i8) &AudioSample
	newSampleFromData fn (&u8, SoundFormat, u32, int) &AudioSample
	getData fn (&AudioSample, &&u8, &SoundFormat, &u32, &u32)
	freeSample fn (&AudioSample)
	getLength fn (&AudioSample) f32
}
struct Playdate_sound_sampleplayer { 
	newPlayer fn () &SamplePlayer
	freePlayer fn (&SamplePlayer)
	setSample fn (&SamplePlayer, &AudioSample)
	play fn (&SamplePlayer, int, f32) int
	isPlaying fn (&SamplePlayer) int
	stop fn (&SamplePlayer)
	setVolume fn (&SamplePlayer, f32, f32)
	getVolume fn (&SamplePlayer, &f32, &f32)
	getLength fn (&SamplePlayer) f32
	setOffset fn (&SamplePlayer, f32)
	setRate fn (&SamplePlayer, f32)
	setPlayRange fn (&SamplePlayer, int, int)
	setFinishCallback fn (&SamplePlayer, &SndCallbackProc)
	setLoopCallback fn (&SamplePlayer, &SndCallbackProc)
	getOffset fn (&SamplePlayer) f32
	getRate fn (&SamplePlayer) f32
	setPaused fn (&SamplePlayer, int)
}
type SignalStepFunc = fn (voidptr, &int, &f32) f32
type SignalNoteOnFunc = fn (voidptr, MIDINote, f32, f32)
type SignalNoteOffFunc = fn (voidptr, int, int)
type SignalDeallocFunc = fn (voidptr)
struct Playdate_sound_signal { 
	newSignal fn (SignalStepFunc, SignalNoteOnFunc, SignalNoteOffFunc, SignalDeallocFunc, voidptr) &PDSynthSignal
	freeSignal fn (&PDSynthSignal)
	getValue fn (&PDSynthSignal) f32
	setValueScale fn (&PDSynthSignal, f32)
	setValueOffset fn (&PDSynthSignal, f32)
}
enum LFOType {
	klfotypesquare
	klfotypetriangle
	klfotypesine
	klfotypesampleandhold
	klfotypesawtoothup
	klfotypesawtoothdown
	klfotypearpeggiator
	klfotypefunction
}

struct Playdate_sound_lfo { 
	newLFO fn (LFOType) &PDSynthLFO
	freeLFO fn (&PDSynthLFO)
	setType fn (&PDSynthLFO, LFOType)
	setRate fn (&PDSynthLFO, f32)
	setPhase fn (&PDSynthLFO, f32)
	setCenter fn (&PDSynthLFO, f32)
	setDepth fn (&PDSynthLFO, f32)
	setArpeggiation fn (&PDSynthLFO, int, &f32)
	setFunction fn (&PDSynthLFO, &Float  (PDSynthLFO, voidptr)
	setDelay fn (&PDSynthLFO, f32, f32)
	setRetrigger fn (&PDSynthLFO, int)
	getValue fn (&PDSynthLFO) f32
	setGlobal fn (&PDSynthLFO, int)
	setStartPhase fn (&PDSynthLFO, f32)
}
struct Playdate_sound_envelope { 
	newEnvelope fn (f32, f32, f32, f32) &PDSynthEnvelope
	freeEnvelope fn (&PDSynthEnvelope)
	setAttack fn (&PDSynthEnvelope, f32)
	setDecay fn (&PDSynthEnvelope, f32)
	setSustain fn (&PDSynthEnvelope, f32)
	setRelease fn (&PDSynthEnvelope, f32)
	setLegato fn (&PDSynthEnvelope, int)
	setRetrigger fn (&PDSynthEnvelope, int)
	getValue fn (&PDSynthEnvelope) f32
	setCurvature fn (&PDSynthEnvelope, f32)
	setVelocitySensitivity fn (&PDSynthEnvelope, f32)
	setRateScaling fn (&PDSynthEnvelope, f32, MIDINote, MIDINote)
}
enum SoundWaveform {
	kwaveformsquare
	kwaveformtriangle
	kwaveformsine
	kwaveformnoise
	kwaveformsawtooth
	kwaveformpophase
	kwaveformpodigital
	kwaveformpovosim
}

type SynthRenderFunc = fn (voidptr, &int, &int, int, u32, int) int
type SynthNoteOnFunc = fn (voidptr, MIDINote, f32, f32)
type SynthReleaseFunc = fn (voidptr, int)
type SynthSetParameterFunc = fn (voidptr, int, f32) int
type SynthDeallocFunc = fn (voidptr)
struct Playdate_sound_synth { 
	newSynth fn () &PDSynth
	freeSynth fn (&PDSynth)
	setWaveform fn (&PDSynth, SoundWaveform)
	setGenerator fn (&PDSynth, int, SynthRenderFunc, SynthNoteOnFunc, SynthReleaseFunc, SynthSetParameterFunc, SynthDeallocFunc, voidptr)
	setSample fn (&PDSynth, &AudioSample, u32, u32)
	setAttackTime fn (&PDSynth, f32)
	setDecayTime fn (&PDSynth, f32)
	setSustainLevel fn (&PDSynth, f32)
	setReleaseTime fn (&PDSynth, f32)
	setTranspose fn (&PDSynth, f32)
	setFrequencyModulator fn (&PDSynth, &PDSynthSignalValue)
	getFrequencyModulator fn (&PDSynth) &PDSynthSignalValue
	setAmplitudeModulator fn (&PDSynth, &PDSynthSignalValue)
	getAmplitudeModulator fn (&PDSynth) &PDSynthSignalValue
	getParameterCount fn (&PDSynth) int
	setParameter fn (&PDSynth, int, f32) int
	setParameterModulator fn (&PDSynth, int, &PDSynthSignalValue)
	getParameterModulator fn (&PDSynth, int) &PDSynthSignalValue
	playNote fn (&PDSynth, f32, f32, f32, u32)
	playMIDINote fn (&PDSynth, MIDINote, f32, f32, u32)
	noteOff fn (&PDSynth, u32)
	stop fn (&PDSynth)
	setVolume fn (&PDSynth, f32, f32)
	getVolume fn (&PDSynth, &f32, &f32)
	isPlaying fn (&PDSynth) int
	getEnvelope fn (&PDSynth) &PDSynthEnvelope
	setWavetable fn (&PDSynth, &AudioSample, int, int, int) int
}
struct Playdate_control_signal { 
	newSignal fn () &ControlSignal
	freeSignal fn (&ControlSignal)
	clearEvents fn (&ControlSignal)
	addEvent fn (&ControlSignal, int, f32, int)
	removeEvent fn (&ControlSignal, int)
	getMIDIControllerNumber fn (&ControlSignal) int
}
struct Playdate_sound_instrument { 
	newInstrument fn () &PDSynthInstrument
	freeInstrument fn (&PDSynthInstrument)
	addVoice fn (&PDSynthInstrument, &PDSynth, MIDINote, MIDINote, f32) int
	playNote fn (&PDSynthInstrument, f32, f32, f32, u32) &PDSynth
	playMIDINote fn (&PDSynthInstrument, MIDINote, f32, f32, u32) &PDSynth
	setPitchBend fn (&PDSynthInstrument, f32)
	setPitchBendRange fn (&PDSynthInstrument, f32)
	setTranspose fn (&PDSynthInstrument, f32)
	noteOff fn (&PDSynthInstrument, MIDINote, u32)
	allNotesOff fn (&PDSynthInstrument, u32)
	setVolume fn (&PDSynthInstrument, f32, f32)
	getVolume fn (&PDSynthInstrument, &f32, &f32)
	activeVoiceCount fn (&PDSynthInstrument) int
}
struct Playdate_sound_track { 
	newTrack fn () &SequenceTrack
	freeTrack fn (&SequenceTrack)
	setInstrument fn (&SequenceTrack, &PDSynthInstrument)
	getInstrument fn (&SequenceTrack) &PDSynthInstrument
	addNoteEvent fn (&SequenceTrack, u32, u32, MIDINote, f32)
	removeNoteEvent fn (&SequenceTrack, u32, MIDINote)
	clearNotes fn (&SequenceTrack)
	getControlSignalCount fn (&SequenceTrack) int
	getControlSignal fn (&SequenceTrack, int) &ControlSignal
	clearControlEvents fn (&SequenceTrack)
	getPolyphony fn (&SequenceTrack) int
	activeVoiceCount fn (&SequenceTrack) int
	setMuted fn (&SequenceTrack, int)
	getLength fn (&SequenceTrack) u32
	getIndexForStep fn (&SequenceTrack, u32) int
	getNoteAtIndex fn (&SequenceTrack, int, &u32, &u32, &MIDINote, &f32) int
	getSignalForController fn (&SequenceTrack, int, int) &ControlSignal
}
type SequenceFinishedCallback = fn (&SoundSequence, voidptr)
struct Playdate_sound_sequence { 
	newSequence fn () &SoundSequence
	freeSequence fn (&SoundSequence)
	loadMidiFile fn (&SoundSequence, &i8) int
	getTime fn (&SoundSequence) u32
	setTime fn (&SoundSequence, u32)
	setLoops fn (&SoundSequence, int, int, int)
	getTempo fn (&SoundSequence) int
	setTempo fn (&SoundSequence, f32)
	getTrackCount fn (&SoundSequence) int
	addTrack fn (&SoundSequence) &SequenceTrack
	getTrackAtIndex fn (&SoundSequence, u32) &SequenceTrack
	setTrackAtIndex fn (&SoundSequence, &SequenceTrack, u32)
	allNotesOff fn (&SoundSequence)
	isPlaying fn (&SoundSequence) int
	getLength fn (&SoundSequence) u32
	play fn (&SoundSequence, SequenceFinishedCallback, voidptr)
	stop fn (&SoundSequence)
	getCurrentStep fn (&SoundSequence, &int) int
	setCurrentStep fn (&SoundSequence, int, int, int)
}
enum TwoPoleFilterType {
	kfiltertypelowpass
	kfiltertypehighpass
	kfiltertypebandpass
	kfiltertypenotch
	kfiltertypepeq
	kfiltertypelowshelf
	kfiltertypehighshelf
}

struct Playdate_sound_effect_twopolefilter { 
	newFilter fn () &TwoPoleFilter
	freeFilter fn (&TwoPoleFilter)
	setType fn (&TwoPoleFilter, TwoPoleFilterType)
	setFrequency fn (&TwoPoleFilter, f32)
	setFrequencyModulator fn (&TwoPoleFilter, &PDSynthSignalValue)
	getFrequencyModulator fn (&TwoPoleFilter) &PDSynthSignalValue
	setGain fn (&TwoPoleFilter, f32)
	setResonance fn (&TwoPoleFilter, f32)
	setResonanceModulator fn (&TwoPoleFilter, &PDSynthSignalValue)
	getResonanceModulator fn (&TwoPoleFilter) &PDSynthSignalValue
}
struct Playdate_sound_effect_onepolefilter { 
	newFilter fn () &OnePoleFilter
	freeFilter fn (&OnePoleFilter)
	setParameter fn (&OnePoleFilter, f32)
	setParameterModulator fn (&OnePoleFilter, &PDSynthSignalValue)
	getParameterModulator fn (&OnePoleFilter) &PDSynthSignalValue
}
struct Playdate_sound_effect_bitcrusher { 
	newBitCrusher fn () &BitCrusher
	freeBitCrusher fn (&BitCrusher)
	setAmount fn (&BitCrusher, f32)
	setAmountModulator fn (&BitCrusher, &PDSynthSignalValue)
	getAmountModulator fn (&BitCrusher) &PDSynthSignalValue
	setUndersampling fn (&BitCrusher, f32)
	setUndersampleModulator fn (&BitCrusher, &PDSynthSignalValue)
	getUndersampleModulator fn (&BitCrusher) &PDSynthSignalValue
}
struct Playdate_sound_effect_ringmodulator { 
	newRingmod fn () &RingModulator
	freeRingmod fn (&RingModulator)
	setFrequency fn (&RingModulator, f32)
	setFrequencyModulator fn (&RingModulator, &PDSynthSignalValue)
	getFrequencyModulator fn (&RingModulator) &PDSynthSignalValue
}
struct Playdate_sound_effect_delayline { 
	newDelayLine fn (int, int) &DelayLine
	freeDelayLine fn (&DelayLine)
	setLength fn (&DelayLine, int)
	setFeedback fn (&DelayLine, f32)
	addTap fn (&DelayLine, int) &DelayLineTap
	freeTap fn (&DelayLineTap)
	setTapDelay fn (&DelayLineTap, int)
	setTapDelayModulator fn (&DelayLineTap, &PDSynthSignalValue)
	getTapDelayModulator fn (&DelayLineTap) &PDSynthSignalValue
	setTapChannelsFlipped fn (&DelayLineTap, int)
}
struct Playdate_sound_effect_overdrive { 
	newOverdrive fn () &Overdrive
	freeOverdrive fn (&Overdrive)
	setGain fn (&Overdrive, f32)
	setLimit fn (&Overdrive, f32)
	setLimitModulator fn (&Overdrive, &PDSynthSignalValue)
	getLimitModulator fn (&Overdrive) &PDSynthSignalValue
	setOffset fn (&Overdrive, f32)
	setOffsetModulator fn (&Overdrive, &PDSynthSignalValue)
	getOffsetModulator fn (&Overdrive) &PDSynthSignalValue
}
type EffectProc = Int (SoundEffect *, int32_t *, int32_t *, int, int)
struct Playdate_sound_effect { 
	newEffect fn (&EffectProc, voidptr) &SoundEffect
	freeEffect fn (&SoundEffect)
	setMix fn (&SoundEffect, f32)
	setMixModulator fn (&SoundEffect, &PDSynthSignalValue)
	getMixModulator fn (&SoundEffect) &PDSynthSignalValue
	setUserdata fn (&SoundEffect, voidptr)
	getUserdata fn (&SoundEffect) voidptr
	twopolefilter &Playdate_sound_effect_twopolefilter
	onepolefilter &Playdate_sound_effect_onepolefilter
	bitcrusher &Playdate_sound_effect_bitcrusher
	ringmodulator &Playdate_sound_effect_ringmodulator
	delayline &Playdate_sound_effect_delayline
	overdrive &Playdate_sound_effect_overdrive
}
type AudioSourceFunction = Int (void *, int16_t *, int16_t *, int)
struct RecordCallback { 
	newChannel fn () &SoundChannel
	freeChannel fn (&SoundChannel)
	addSource fn (&SoundChannel, &SoundSource) int
	removeSource fn (&SoundChannel, &SoundSource) int
	addCallbackSource fn (&SoundChannel, &AudioSourceFunction, voidptr, int) &SoundSource
	addEffect fn (&SoundChannel, &SoundEffect)
	removeEffect fn (&SoundChannel, &SoundEffect)
	setVolume fn (&SoundChannel, f32)
	getVolume fn (&SoundChannel) f32
	setVolumeModulator fn (&SoundChannel, &PDSynthSignalValue)
	getVolumeModulator fn (&SoundChannel) &PDSynthSignalValue
	setPan fn (&SoundChannel, f32)
	setPanModulator fn (&SoundChannel, &PDSynthSignalValue)
	getPanModulator fn (&SoundChannel) &PDSynthSignalValue
	getDryLevelSignal fn (&SoundChannel) &PDSynthSignalValue
	getWetLevelSignal fn (&SoundChannel) &PDSynthSignalValue
}
struct Playdate_sound { 
	channel &Playdate_sound_channel
	fileplayer &Playdate_sound_fileplayer
	sample &Playdate_sound_sample
	sampleplayer &Playdate_sound_sampleplayer
	synth &Playdate_sound_synth
	sequence &Playdate_sound_sequence
	effect &Playdate_sound_effect
	lfo &Playdate_sound_lfo
	envelope &Playdate_sound_envelope
	source &Playdate_sound_source
	controlsignal &Playdate_control_signal
	track &Playdate_sound_track
	instrument &Playdate_sound_instrument
	getCurrentTime fn () u32
	addSource fn (&AudioSourceFunction, voidptr, int) &SoundSource
	getDefaultChannel fn () &SoundChannel
	addChannel fn (&SoundChannel) int
	removeChannel fn (&SoundChannel) int
	setMicCallback fn (&RecordCallback, voidptr, int)
	getHeadphoneState fn (&int, &int, Void  (int, int)
	setOutputsActive fn (int, int)
	removeSource fn (&SoundSource) int
	signal &Playdate_sound_signal
	getError fn () &i8
}
struct Playdate_display { 
	getWidth fn () int
	getHeight fn () int
	setRefreshRate fn (f32)
	setInverted fn (int)
	setScale fn (u32)
	setMosaic fn (u32, u32)
	setFlipped fn (int, int)
	setOffset fn (int, int)
}
struct PDScore { 
	rank u32
	value u32
	player &i8
}
struct PDScoresList { 
	boardID &i8
	count u32
	lastUpdated u32
	playerIncluded int
	limit u32
	scores &PDScore
}
struct PDBoard { 
	boardID &i8
	name &i8
}
struct PDBoardsList { 
	count u32
	lastUpdated u32
	boards &PDBoard
}
type AddScoreCallback = fn (&PDScore, &i8)
type PersonalBestCallback = fn (&PDScore, &i8)
type BoardsListCallback = fn (&PDBoardsList, &i8)
type ScoresCallback = fn (&PDScoresList, &i8)
struct Playdate_scoreboards { 
	addScore fn (&i8, u32, AddScoreCallback) int
	getPersonalBest fn (&i8, PersonalBestCallback) int
	freeScore fn (&PDScore)
	getScoreboards fn (BoardsListCallback) int
	freeBoardsList fn (&PDBoardsList)
	getScores fn (&i8, ScoresCallback) int
	freeScoresList fn (&PDScoresList)
}
enum PDSystemEvent {
	keventinit
	keventinitlua
	keventlock
	keventunlock
	keventpause
	keventresume
	keventterminate
	keventkeypressed
	keventkeyreleased
	keventlowpower
}

fn C.eventHandler(playdate &PlaydateAPI, event PDSystemEvent, arg u32) int

pub fn eventhandler(playdate &PlaydateAPI, event PDSystemEvent, arg u32) int {
	return C.eventHandler(playdate, event, arg)
}

