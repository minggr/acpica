/******************************************************************************
 *
 * Module Name: ahaslops - Table of all known ASL operators
 *
 *****************************************************************************/

/******************************************************************************
 *
 * 1. Copyright Notice
 *
 * Some or all of this work - Copyright (c) 1999 - 2011, Intel Corp.
 * All rights reserved.
 *
 * 2. License
 *
 * 2.1. This is your license from Intel Corp. under its intellectual property
 * rights.  You may have additional license terms from the party that provided
 * you this software, covering your right to use that party's intellectual
 * property rights.
 *
 * 2.2. Intel grants, free of charge, to any person ("Licensee") obtaining a
 * copy of the source code appearing in this file ("Covered Code") an
 * irrevocable, perpetual, worldwide license under Intel's copyrights in the
 * base code distributed originally by Intel ("Original Intel Code") to copy,
 * make derivatives, distribute, use and display any portion of the Covered
 * Code in any form, with the right to sublicense such rights; and
 *
 * 2.3. Intel grants Licensee a non-exclusive and non-transferable patent
 * license (with the right to sublicense), under only those claims of Intel
 * patents that are infringed by the Original Intel Code, to make, use, sell,
 * offer to sell, and import the Covered Code and derivative works thereof
 * solely to the minimum extent necessary to exercise the above copyright
 * license, and in no event shall the patent license extend to any additions
 * to or modifications of the Original Intel Code.  No other license or right
 * is granted directly or by implication, estoppel or otherwise;
 *
 * The above copyright and patent license is granted only if the following
 * conditions are met:
 *
 * 3. Conditions
 *
 * 3.1. Redistribution of Source with Rights to Further Distribute Source.
 * Redistribution of source code of any substantial portion of the Covered
 * Code or modification with rights to further distribute source must include
 * the above Copyright Notice, the above License, this list of Conditions,
 * and the following Disclaimer and Export Compliance provision.  In addition,
 * Licensee must cause all Covered Code to which Licensee contributes to
 * contain a file documenting the changes Licensee made to create that Covered
 * Code and the date of any change.  Licensee must include in that file the
 * documentation of any changes made by any predecessor Licensee.  Licensee
 * must include a prominent statement that the modification is derived,
 * directly or indirectly, from Original Intel Code.
 *
 * 3.2. Redistribution of Source with no Rights to Further Distribute Source.
 * Redistribution of source code of any substantial portion of the Covered
 * Code or modification without rights to further distribute source must
 * include the following Disclaimer and Export Compliance provision in the
 * documentation and/or other materials provided with distribution.  In
 * addition, Licensee may not authorize further sublicense of source of any
 * portion of the Covered Code, and must include terms to the effect that the
 * license from Licensee to its licensee is limited to the intellectual
 * property embodied in the software Licensee provides to its licensee, and
 * not to intellectual property embodied in modifications its licensee may
 * make.
 *
 * 3.3. Redistribution of Executable. Redistribution in executable form of any
 * substantial portion of the Covered Code or modification must reproduce the
 * above Copyright Notice, and the following Disclaimer and Export Compliance
 * provision in the documentation and/or other materials provided with the
 * distribution.
 *
 * 3.4. Intel retains all right, title, and interest in and to the Original
 * Intel Code.
 *
 * 3.5. Neither the name Intel nor any other trademark owned or controlled by
 * Intel shall be used in advertising or otherwise to promote the sale, use or
 * other dealings in products derived from or relating to the Covered Code
 * without prior written authorization from Intel.
 *
 * 4. Disclaimer and Export Compliance
 *
 * 4.1. INTEL MAKES NO WARRANTY OF ANY KIND REGARDING ANY SOFTWARE PROVIDED
 * HERE.  ANY SOFTWARE ORIGINATING FROM INTEL OR DERIVED FROM INTEL SOFTWARE
 * IS PROVIDED "AS IS," AND INTEL WILL NOT PROVIDE ANY SUPPORT,  ASSISTANCE,
 * INSTALLATION, TRAINING OR OTHER SERVICES.  INTEL WILL NOT PROVIDE ANY
 * UPDATES, ENHANCEMENTS OR EXTENSIONS.  INTEL SPECIFICALLY DISCLAIMS ANY
 * IMPLIED WARRANTIES OF MERCHANTABILITY, NONINFRINGEMENT AND FITNESS FOR A
 * PARTICULAR PURPOSE.
 *
 * 4.2. IN NO EVENT SHALL INTEL HAVE ANY LIABILITY TO LICENSEE, ITS LICENSEES
 * OR ANY OTHER THIRD PARTY, FOR ANY LOST PROFITS, LOST DATA, LOSS OF USE OR
 * COSTS OF PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES, OR FOR ANY INDIRECT,
 * SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THIS AGREEMENT, UNDER ANY
 * CAUSE OF ACTION OR THEORY OF LIABILITY, AND IRRESPECTIVE OF WHETHER INTEL
 * HAS ADVANCE NOTICE OF THE POSSIBILITY OF SUCH DAMAGES.  THESE LIMITATIONS
 * SHALL APPLY NOTWITHSTANDING THE FAILURE OF THE ESSENTIAL PURPOSE OF ANY
 * LIMITED REMEDY.
 *
 * 4.3. Licensee shall not export, either directly or indirectly, any of this
 * software or system incorporating such software without first obtaining any
 * required license or other approval from the U. S. Department of Commerce or
 * any other agency or department of the United States Government.  In the
 * event Licensee exports any such software from the United States or
 * re-exports any such software from a foreign destination, Licensee shall
 * ensure that the distribution and export/re-export of the software is in
 * compliance with all laws, regulations, orders, or other restrictions of the
 * U.S. Export Administration Regulations. Licensee agrees that neither it nor
 * any of its subsidiaries will export/re-export any technical data, process,
 * software, or service, directly or indirectly, to any country for which the
 * United States government or any agency thereof requires an export license,
 * other governmental approval, or letter of assurance, without first obtaining
 * such license, approval or letter.
 *
 *****************************************************************************/

#include "acpihelp.h"

/*
 * ASL operators with syntax (directly from ACPI specification).
 * Note: All tokens require a space separator.
 * Long lines are automatically split during output.
 */
const AH_ASL_OPERATOR       AslOperatorInfo[] =
{
    {"AccessAs",                "(AccessType, AccessAttibute)",
                                "ChangeFieldUnitAccess"},
    {"Acquire",                 "(SyncObject, TimeoutValue) => Boolean",
                                "Acquire a mutex"},
    {"Add",                     "(Addend1, Addend2, Result) => Integer",
                                "Integer Add"},
    {"Alias",                   "(SourceObject, AliasObject)",
                                "Define a name alias"},
    {"And",                     "(Source1, Source2, Result) => Integer",
                                "Integer Bitwise And"},
    {"Arg",                     "Arg0 - Arg6",
                                "Method argument data objects"},
    {"BankField",               "(RegionName, BankName, BankValue, AccessType, LockRule, UpdateRule) {FieldUnitList}",
                                "Declare fields in a banked configuration object"},
    {"Break",                   NULL,
                                "Continue following the innermost enclosing While"},
    {"BreakPoint",              NULL,
                                "Used for debugging, stops execution in the debugger"},
    {"Buffer",                  "(BufferSize) {String or ByteList} => Buffer",
                                "Declare Buffer object"},
    {"Case",                    "(Value) {TermList}",
                                "Expression for conditional execution"},
    {"Concatenate",             "(Source1, Source2, Result) => ComputationalData",
                                "Concatenate two strings}, integers or buffers"},
    {"ConcatenateResTemplate",  "(Source1, Source2, Result) => Buffer",
                                "Concatenate two resource templates"},
    {"CondRefOf",               "(Source, Result) => Boolean",
                                "Conditional reference to an object"},
    {"Continue",                NULL,
                                "Continue innermost enclosing While loop"},
    {"CopyObject",              "(Source, Destination) => DataRefObject",
                                "Copy and existing object"},
    {"CreateBitField",          "(SourceBuffer, BitIndex, BitFieldName)",
                                "Declare a bit field object of a buffer object"},
    {"CreateByteField",         "(SourceBuffer, ByteIndex, ByteFieldName)",
                                "Declare a byte field object of a buffer object"},
    {"CreateDWordField",        "(SourceBuffer, ByteIndex, DWordFieldName)",
                                "Declare a DWord field object of a buffer object"},
    {"CreateField",             "(SourceBuffer, BitIndex, NumBits, FieldName)",
                                "Declare an arbitrary length bit field of a buffer object"},
    {"CreateQWordField",        "(SourceBuffer, ByteIndex, QWordFieldName)",
                                "Declare a QWord field object of a buffer object"},
    {"CreateWordField",         "(SourceBuffer, ByteIndex, WordFieldName)",
                                "Declare a Word field object of a buffer object"},
    {"DataTableRegion",         "(RegionName, SignatureString, OemIDString, OemTableIDString)",
                                "Declare a Data Table Region"},
    {"Debug",                   NULL,
                                "Debugger output"},
    {"Decrement",               "(Minuend) => Integer",
                                "Decrement an Integer"},
    {"Default",                 "{TermList}",
                                "Default execution path in Switch()"},
    {"DefinitionBlock",         "(AMLFileName, TableSignature, ComplianceRevision, OEMID, TableID, OEMRevision) {TermList}",
                                "Declare a Definition Block"},
    {"DerefOf",                 "(Source) => Object",
                                "Dereference an object reference"},
    {"Device",                  "(DeviceName) {ObjectList}",
                                "Declare a bus/device object"},
    {"Divide",                  "(Dividend, Divisor, Remainder, Result) => Integer",
                                "Integer Divide"},
    {"DMA",                     "(DmaType, IsBusMaster, DmaTransferSize, DescriptorName) {DmaChannelList} => Buffer",
                                "DMA Resource Descriptor macro"},
    {"DWordIO",                 "(ResourceUsage, IsMinFixed, IsMaxFixed, Decode, ISARanges, AddressGranularity, "
                                "AddressMinimum, AddressMaximum, AddressTranslation, RangeLength, ResourceSourceIndex, "
                                "ResourceSource, DescriptorName, TranslationType, TranslationDensity)",
                                "DWord IO Resource Descriptor macro"},
    {"DWordMemory",             "(ResourceUsage, Decode, IsMinFixed, IsMaxFixed, Cacheable, ReadAndWrite, "
                                "AddressGranularity, AddressMinimum, AddressMaximum, AddressTranslation, "
                                "RangeLength, ResourceSourceIndex, ResourceSource, DescriptorName, MemoryType, "
                                "TranslationType)",
                                "DWord Memory Resource Descriptor macro"},
    {"DWordSpace",              "(ResourceType, ResourceUsage, Decode, IsMinFixed, IsMaxFixed, TypeSpecificFlags, "
                                "AddressGranularity, AddressMinimum, AddressMaximum, AddressTranslation, RangeLength, "
                                "ResourceSourceIndex, ResourceSource, DescriptorName)",
                                "DWord Space Resource Descriptor macro"},
    {"EISAID",                  "(EisaIdString) => DWordConst",
                                "EISA ID String to Integer conversion macro"},
    {"Else",                    "{TermList}",
                                "Alternate conditional execution"},
    {"ElseIf",                  "(Predicate)",
                                "Conditional execution"},
    {"EndDependentFn",          "() => Buffer",
                                "End Dependent Function Resource Descriptor macro"},
    {"Event",                   "(EventName)",
                                "Declare an event synchronization object"},
    {"ExtendedIO",              "(ResourceUsage, IsMinFixed, IsMaxFixed, Decode, ISARanges, AddressGranularity, "
                                "AddressMinimum, AddressMaximum, AddressTranslation, RangeLength, "
                                "TypeSpecificAttributes, DescriptorName, TranslationType, TranslationDensity)",
                                "Extended IO Resource Descriptor macro"},
    {"ExtendedMemory",          "(ResourceUsage, Decode, IsMinFixed, IsMaxFixed, Cacheable, ReadAndWrite, "
                                "AddressGranularity, AddressMinimum, AddressMaximum, AddressTranslation, "
                                "RangeLength, TypeSpecificAttributes, DescriptorName, MemoryType, TranslationType)",
                                "Extended Memory Resource Descriptor macro"},
    {"ExtendedSpace",           "(ResourceType, ResourceUsage, Decode, IsMinFixed, IsMaxFixed, TypeSpecificFlags, "
                                "AddressGranularity, AddressMinimum, AddressMaximum, AddressTranslation, "
                                "RangeLength, TypeSpecificAttributes, DescriptorName)",
                                "Extended Space Resource Descriptor macro"},
    {"External",                "(ObjectName, ObjectType, ReturnType, ParameterTypes)",
                                "Declare external objects"},
    {"Fatal",                   "(Type, Code, Arg)",
                                "Fatal error check"},
    {"Field",                   "(RegionName, AccessType, LockRule, UpdateRule) {FieldUnitList}",
                                "Declare fields of an operation region object"},
    {"FindSetLeftBit",          "(Source, Result) => Integer",
                                "Index of first least significant bit set"},
    {"FindSetRightBit",         "(Source, Result) => Integer",
                                "Index of first most significant bit set"},
    {"FixedIO",                 "(AddressBase, RangeLength, DescriptorName) => Buffer",
                                "Fixed I/O Resource Descriptor macro"},
    {"FromBCD",                 "(BCDValue, Result) => Integer",
                                "Convert from BCD to numeric"},
    {"Function",                "(FunctionName, ReturnType, ParameterTypes) {TermList}",
                                "Declare control method"},
    {"If",                      "(Predicate) {TermList}",
                                "Conditional execution"},
    {"Include",                 "(FilePathName)",
                                "Include another ASL file"},
    {"Increment",               "(Addend) => Integer",
                                "Increment a Integer"},
    {"Index",                   "(Source, Index, Destination) => ObjectReference",
                                "Indexed Reference to member object"},
    {"IndexField",              "(IndexName, DataName, AccessType, LockRule, UpdateRule) {FieldUnitList}",
                                "Declare Index/Data Fields"},
    {"Interrupt",               "(ResourceUsage, EdgeLevel, ActiveLevel, Shared, ResourceSourceIndex, "
                                "ResourceSource, DescriptorName) {InterruptList} => Buffer",
                                "Interrupt Resource Descriptor macro"},
    {"IO",                      "(Decode, AddressMin, AddressMax, AddressAlignment, RangeLength, DescriptorName) => Buffer",
                                "IO Resource Descriptor macro"},
    {"IRQ",                     "(EdgeLevel, ActiveLevel, Shared, DescriptorName) {InterruptList} => Buffer",
                                "Interrupt Resource Descriptor macro"},
    {"IRQNoFlags",              "(DescriptorName) {InterruptList} => Buffer",
                                "Short Interrupt Resource Descriptor macro"},
    {"LAnd",                    "(Source1, Source2) => Boolean",
                                "Logical And"},
    {"LEqual",                  "(Source1, Source2) => Boolean",
                                "Logical Equal"},
    {"LGreater",                "(Source1, Source2) => Boolean",
                                "Logical Greater"},
    {"LGreaterEqual",           "(Source1, Source2) => Boolean",
                                "Logical Not less"},
    {"LLess",                   "(Source1, Source2) => Boolean",
                                "Logical Less"},
    {"LLessEqual",              "(Source1, Source2) => Boolean",
                                "Logical Not greater"},
    {"LNot",                    "(Source) => Boolean",
                                "Logical Not"},
    {"LNotEqual",               "(Source1, Source2) => Boolean",
                                "Logical Not equal"},
    {"Load",                    "(Object, DDBHandle)",
                                "Load differentiating definition block"},
    {"LoadTable",               "(SignatureString, OEMIDString, OEMTableIDString, RootPathString, "
                                "ParameterPathString, ParameterData) => DDBHandle",
                                "Load Table from RSDT/XSDT"},
    {"Local",                   "Local0 - Local 7",
                                "Method local data objects"},
    {"LOr",                     "(Source1, Source2) => Boolean",
                                "Logical Or"},
    {"Match",                   "(SearchPackage, Op1, MatchObject1, Op2, MatchObject2, StartIndex) => Ones | Integer",
                                "Search for match in package array"},
    {"Memory24",                "(ReadAndWrite, AddressMinimum, AddressMaximum, AddressAlignment, "
                                "RangeLength, DescriptorName)",
                                "Memory Resource Descriptor macro"},
    {"Memory32",                "(ReadAndWrite, AddressMinimum, AddressMaximum, AddressAlignment, "
                                "RangeLength, DescriptorName)",
                                "Memory Resource Descriptor macro"},
    {"Memory32Fixed",           "(ReadAndWrite, AddressBase, RangeLength, DescriptorName)",
                                "Memory Resource Descriptor macro"},
    {"Method",                  "(MethodName, NumArgs, SerializeRule, SyncLevel, ReturnType, ParameterTypes) "
                                "{TermList}",
                                "Declare a control method"},
    {"Mid",                     "(Source, Index, Length, Result) => Buffer or String",
                                "Return a portion of buffer or string"},
    {"Mod",                     "(Dividend, Divisor, Result) => Integer",
                                "Integer Modulo"},
    {"Multiply",                "(Multiplicand, Multiplier, Result) => Integer",
                                "Integer Multiply"},
    {"Mutex",                   "(MutexName, SyncLevel)",
                                "Declare a mutex synchronization object"},
    {"Name",                    "(ObjectName, Object)",
                                "Declare a Named object"},
    {"NAnd",                    "(Source1, Source2, Result) => Integer",
                                "Integer Bitwise Nand"},
    {"NoOp",                    NULL,
                                "No operation"},
    {"NOr",                     "(Source1, Source2, Result) => Integer",
                                "Integer Bitwise Nor"},
    {"Not",                     "(Source, Result) => Integer",
                                "Integer Bitwise Not"},
    {"Notify",                  "(Object, NotificationValue)",
                                "Notify Object of event"},
    {"ObjectType",              "(Object) => Integer",
                                "Type of object"},
    {"Offset",                  "(ByteOffset)",
                                "Change Current Field Unit Offset"},
    {"One",                     "=> Integer",
                                "Constant One Object (1)"},
    {"Ones",                    "=> Integer",
                                "Constant Ones Object (-1)"},
    {"OperationRegion",         "(RegionName, RegionSpace, Offset, Length)",
                                "Declare an operational region"},
    {"Or",                      "(Source1, Source2, Result) => Integer",
                                "Integer Bitwise Or"},
    {"Package",                 "(NumElements) {PackageList} => Package",
                                "Declare a package object"},
    {"PowerResource",           "(ResourceName, SystemLevel, ResourceOrder) {ObjectList}",
                                "Declare a power resource object"},
    {"Processor",               "(ProcessorName, ProcessorID, PBlockAddress, PblockLength) {ObjectList}",
                                "Declare a processor package"},
    {"QWordIO",                 "(ResourceUsage, IsMinFixed, IsMaxFixed, Decode, ISARanges, AddressGranularity, "
                                "AddressMinimum, AddressMaximum, AddressTranslation, RangeLength, "
                                "ResourceSourceIndex, ResourceSource, DescriptorName, TranslationType, "
                                "TranslationDensity)",
                                "QWord IO Resource Descriptor macro"},
    {"QWordMemory",             "(ResourceUsage, Decode, IsMinFixed, IsMaxFixed, Cacheable, ReadAndWrite, "
                                "AddressGranularity, AddressMinimum, AddressMaximum, AddressTranslation, "
                                "RangeLength, ResourceSourceIndex, ResourceSource, DescriptorName, MemoryType, "
                                "TranslationType)",
                                "QWord Memory Resource Descriptor macro"},
    {"QWordSpace",              "(ResourceType, ResourceUsage, Decode, IsMinFixed, IsMaxFixed, TypeSpecificFlags, "
                                "AddressGranularity, AddressMinimum, AddressMaximum, AddressTranslation, "
                                "RangeLength, ResourceSourceIndex, ResourceSource, DescriptorName)",
                                "Qword Space Resource Descriptor macro"},
    {"RefOf",                   "(Object) => ObjectReference",
                                "Create Reference to an object"},
    {"Register",                "(AddressSpaceKeyword, RegisterBitWidth, RegisterBitOffset, RegisterAddress, "
                                "AccessSize, DescriptorName)",
                                "Generic register Resource Descriptor macro"},
    {"Release",                 "(SyncObject)",
                                "Release a synchronization object"},
    {"Reset",                   "(SyncObject)",
                                "Reset a synchronization object"},
    {"ResourceTemplate",        "() {ResourceMacroList} => Buffer",
                                "Resource to buffer conversion macro"},
    {"Return",                  "None | () | (ReturnArg)",
                                "Return from method execution"},
    {"Revision",                "=> Integer",
                                "Constant revision object"},
    {"Scope",                   "(Location) {ObjectList}",
                                "Open named scope "},
    {"ShiftLeft",               "(Source, ShiftCount, Result) => Integer",
                                "Integer shift value left"},
    {"ShiftRight",              "(Source, ShiftCount, Result) => Integer",
                                "Integer shift value right"},
    {"Signal",                  "(SyncObject)",
                                "Signal a synchronization object"},
    {"SizeOf",                  "(ObjectName) => Integer",
                                "Get the size of a buffer}, string}, or package"},
    {"Sleep",                   "(MilliSeconds)",
                                "Sleep n milliseconds (yields the processor)"},
    {"Stall",                   "(MicroSeconds)",
                                "Delay n microseconds (does not yield the processor)"},
    {"StartDependentFn",        "(CompatibilityPriority, PerformancePriority) {ResourceList}",
                                "Start Dependent Function Resource Descriptor macro"},
    {"StartDependentFnNoPri",   "() {ResourceList}",
                                "Start Dependent Function Resource Descriptor macro"},
    {"Store",                   "(Source, Destination) => DataRefObject",
                                "Store object"},
    {"Subtract",                "(Minuend, Subtrahend, Result) => Integer",
                                "Integer Subtract"},
    {"Switch",                  "(Expression) {CaseTermList}",
                                "Select code to execute based on expression value"},
    {"ThermalZone",             "(ThermalZoneName) {ObjectList}",
                                "Declare a thermal zone package"},
    {"Timer",                   "=> Integer",
                                "Get 64-bit timer value"},
    {"ToBCD",                   "(Value, Result) => Integer",
                                "Convert Integer to BCD"},
    {"ToBuffer",                "(Data, Result) => Buffer",
                                "Convert data type to buffer"},
    {"ToDecimalString",         "(Data, Result) => String",
                                "Convert data type to decimal string"},
    {"ToHexString",             "(Data, Result) => String",
                                "Convert data type to hexadecimal string"},
    {"ToInteger",               "(Data, Result) => Integer",
                                "Convert data type to integer"},
    {"ToString",                "(Source, Length, Result) => String",
                                "Copy ASCII string from buffer"},
    {"ToUUID",                  "(AsciiString) => Buffer",
                                "Convert Ascii string to UUID"},
    {"Unicode",                 "(String) => Buffer",
                                "String to Unicode conversion macro"},
    {"Unload",                  "(Handle)",
                                "Unload definition block"},
    {"VendorLong",              "(DescriptorName) {VendorByteList}",
                                "Vendor Resource Descriptor"},
    {"VendorShort",             "(DescriptorName) {VendorByteList}",
                                "Vendor Resource Descriptor"},
    {"Wait",                    "(SyncObject, TimeoutValue) => Boolean",
                                "Wait on an Event"},
    {"While",                   "(Predicate) {TermList}",
                                "Conditional loop"},
    {"WordBusNumber",           "(ResourceUsage, IsMinFixed, IsMaxFixed, Decode, AddressGranularity, AddressMinimum, "
                                "AddressMaximum, AddressTranslation, RangeLength, ResourceSourceIndex, "
                                "ResourceSource, DescriptorName)",
                                "Word Bus number Resource Descriptor macro"},
    {"WordIO",                  "(ResourceUsage, IsMinFixed, IsMaxFixed, Decode, ISARanges, AddressGranularity, "
                                "AddressMinimum, AddressMaximum, AddressTranslation, RangeLength, "
                                "ResourceSourceIndex, ResourceSource, DescriptorName, TranslationType, "
                                "TranslationDensity)",
                                "Word IO Resource Descriptor macro"},
    {"WordSpace",               "(ResourceType, ResourceUsage, Decode, IsMinFixed, IsMaxFixed, TypeSpecificFlags, "
                                "AddressGranularity, AddressMinimum, AddressMaximum, AddressTranslation, "
                                "RangeLength, ResourceSourceIndex, ResourceSource, DescriptorName)",
                                "Word Space Resource Descriptor macro"},
    {"XOr",                     "(Source1, Source2, Result) => Integer",
                                "Integer Bitwise Xor"},
    {"Zero",                    "=> Integer",
                                "Constant Zero object (0)"},
    {NULL, NULL, NULL}
};
