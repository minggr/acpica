/*
 * Some or all of this work - Copyright (c) 2006 - 2011, Intel Corp.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 * Neither the name of Intel Corporation nor the names of its contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 * 1-level model: \\<Method>
 *
 * Data for DerefOf(<String>) are 0 levels up.
 * (data being referred are in the same Method which
 *  initiates DerefOf(<String>)).
 *
 * DataLevel<number_of_levels_in_model><data_are_N_levels_up>.asl
 *
 *
 * 1. mfa0:
 *    see mfa0 - after bug fix add checking of values of UnitFields not only type checks
 */


/*
 * 0 - Check different ways to pass String
 */
Method(mdac)
{
	Method(mm00)
	{
		Return("b000")
	}

	Method(mm01, 1)
	{
		Return(arg0)
	}

	Method(mm02, 1)
	{
		Store(DerefOf(arg0), Local7)

		Return(Local7)
	}

	Name(b000, Buffer(){ 1, 2, 3, 4, 0x95, 6, 7, 8})
	Name(bb00, Buffer(){ 1, 2, 3, 4, 0x95, 6, 7, 8})
	Name(s000, "b000")
	Name(ss00, "b000")
	Name(i000, 0)

	Store("b000", Local0)
	CopyObject("b000", i000)
	Store(s000, Local7)

	// Checkings

	CH03("", 0, 0x000, 0, 0)

	Store(DerefOf("b000"), Local1)
	mf88(Local1, c00b, bb00, 0x001, 0x002, 1)

	Store(DerefOf(Local0), Local1)
	mf88(Local1, c00b, bb00, 0x003, 0x004, 1)

	Store(DerefOf(Local7), Local1)
	mf88(Local1, c00b, bb00, 0x005, 0x006, 1)

	Store(DerefOf(s000), Local1)
	Store(DerefOf(s000), Local1)
	Store(DerefOf(s000), Local1)
	Store(DerefOf(s000), Local1)
	Store(DerefOf(s000), Local1)
	Store(DerefOf(s000), Local1)
	Store(DerefOf(s000), Local1)
	Store(DerefOf(s000), Local1)
	Store(DerefOf(s000), Local1)
	mf88(Local1, c00b, bb00, 0x007, 0x008, 1)

	Store(DerefOf(mm00()), Local1)
	mf88(Local1, c00b, bb00, 0x009, 0x00a, 1)

	Store(DerefOf(mm01(ss00)), Local1)
	mf88(Local1, c00b, bb00, 0x00b, 0x00c, 1)

	Store(DerefOf(ToString("b000")), Local1)
	mf88(Local1, c00b, bb00, 0x00d, 0x00e, 1)

	Store(DerefOf(Store("b000", Local6)), Local1)
	mf88(Local1, c00b, bb00, 0x00f, 0x010, 1)

	Store(DerefOf(i000), Local1)
	mf88(Local1, c00b, bb00, 0x011, 0x012, 1)

	Store(mm02("^b000"), Local1)
	mf88(Local1, c00b, bb00, 0x013, 0x014, 1)

	CH03("", 0, 0x015, 0, 0)
}

/*
 * 1 - Check different ways to specify elements of NameSpace
 */
Method(mf89)
{
	Name(i010, 0xaabc0123)
	Processor(pr01, 0, 0xFFFFFFFF, 0)
	{
		Name(i000, 0xaabc0000)
	}
	Name(ii00, 0xaabc0123)

	Name(b001, Buffer(){ 1, 2, 3, 4, 0x95, 6, 7, 8})
	Name(bb01, Buffer(){ 1, 2, 3, 4, 0x95, 6, 7, 8})

	// Checkings

	Store(DerefOf("b001"), Local1)
	mf88(Local1, c00b, bb01, 0x000, 0x001, 1)

	Store(DerefOf("^mf89.b001"), Local1)
	if (FLG9) {
		mf88(Local1, c00b, bb01, 0x002, 0x003, 1)
	} else {
		CH04("", 0, 0xff, 0, 0x004, 0, 0)
	}

	Store(DerefOf("^mf89.pr01.i000"), Local1)
	if (FLG9) {
		mf88(Local1, c009, 0xaabc0000, 0x005, 0x006, 1)
	} else {
		CH04("", 0, 0xff, 0, 0x007, 0, 0)
	}

	Store(DerefOf("\\mf89.pr01.i000"), Local1)
	if (FLG9) {
		mf88(Local1, c009, 0xaabc0000, 0x008, 0x009, 1)
	} else {
		CH04("", 0, 0xff, 0, 0x00a, 0, 0) // AE_NOT_FOUND
	}

	Store(DerefOf("^mf89.i010"), Local1)
	if (FLG9) {
		mf88(Local1, c009, ii00, 0x00b, 0x00c, 1)
	} else {
		CH04("", 0, 0xff, 0, 0x00d, 0, 0) // AE_NOT_FOUND
	}

	CH03("", 0, 0x00e, 0, 0)
}

/*
 * 2 - Check access to calculated type objects - DerefOf(<String>)
 */
Method(mf8a)
{
	Name(b002, Buffer(){ 1, 2, 3, 4, 0x95, 6, 7, 8})
	Name(bb02, Buffer(){ 1, 2, 3, 4, 0x95, 6, 7, 8})
	Name(s002, "String")
	Name(ss02, "String")
	Name(i002, 0xabbc0000)
	Name(ii02, 0xabbc0000)
	Name(p002, Package() {1,2,3,4})

	CH03("", 0, 0x01f, 0, 0)

	// Checkings

	Store(DerefOf("b002"), Local1)
	mf88(Local1, c00b, bb02, 0x020, 0x021, 1)

	Store(DerefOf("s002"), Local1)
	mf88(Local1, c00a, ss02, 0x022, 0x023, 1)

	Store(DerefOf("i002"), Local1)
	mf88(Local1, c009, ii02, 0x024, 0x025, 1)

	Store(DerefOf("p002"), Local1)
	mf88(Local1, c00c, 0, 0x026, 0x027, 0)

	CH03("", 0, 0x028, 0, 0)
}

/*
 * 3 - Check access to special type objects - DerefOf(<String>)
 */
Method(mf8b)
{
	Event(e003)
	Mutex(mx03, 0)
	Device(d003) { Name(i900, 0xabcd0017) }
	ThermalZone(tz03) {}
	Processor(pr03, 0, 0xFFFFFFFF, 0) {}
	OperationRegion(r003, SystemMemory, 0x100, 0x100)
	PowerResource(pw03, 1, 0) {Method(mmmm){return (0)}}

	// Checkings

	CH03("", 0, 0x029, 0, 0)
	CopyObject(DerefOf("e003"), Local1)
	mf88(Local1, c00f, 0, 0x02a, 0x02b, 0)

	CH03("", 0, 0x02c, 0, 0)
	CopyObject(DerefOf("mx03"), Local1)
	mf88(Local1, c011, 0, 0x02d, 0x02e, 0)

	CH03("", 0, 0x02f, 0, 0)
	CopyObject(DerefOf("d003"), Local1)
	mf88(Local1, c00e, 0, 0x030, 0x031, 0)

	CH03("", 0, 0x032, 0, 0)
	CopyObject(DerefOf("tz03"), Local1)
	mf88(Local1, c015, 0, 0x033, 0x034, 0)

	CH03("", 0, 0x035, 0, 0)
	CopyObject(DerefOf("pr03"), Local1)
	mf88(Local1, c014, 0, 0x036, 0x037, 0)

	if (y510) {
		CH03("", 0, 0x038, 0, 0)
		CopyObject(DerefOf("r003"), Local1)
		mf88(Local1, c012, 0, 0x039, 0x03a, 0)
	}

	CH03("", 0, 0x03b, 0, 0)
	CopyObject(DerefOf("pw03"), Local1)
	mf88(Local1, c013, 0, 0x03c, 0x03d, 0)
}

/*
 * 4 - Check DerefOf(<Not-String>) - calculated type objects
 */
Method(mf8c)
{
	Name(b004, Buffer(){ 1, 2, 3, 4, 0x95, 6, 7, 8})
	Name(i004, 0xabbc0000)
	Name(p004, Package() {1,2,3,4})

	// Checkings

	CH03("", 0, 0x03e, 0, 0)
	Store(DerefOf(b004), Local1)
	CH04("", 0, 0xff, 0, 0x03f, 0, 0)

	CH03("", 0, 0x040, 0, 0)
	Store(DerefOf(i004), Local1)
	CH04("", 0, 0xff, 0, 0x041, 0, 0)

	CH03("", 0, 0x042, 0, 0)
	Store(DerefOf(p004), Local1)
	CH04("", 0, 0xff, 0, 0x043, 0, 0)
}

/*
 * 5 - Check DerefOf(<String>) - but String doesnt refer NameSpace object
 */
Method(mf8d)
{
	CH03("", 0, 0x044, 0, 0)
	Store(DerefOf("0123"), Local1)
	CH04("", 0, 0xff, 0, 0x045, 0, 0)

	CH03("", 0, 0x046, 0, 0)
	Store(DerefOf("zxcvbnm,./;'\][0123"), Local1)
	CH04("", 0, 0xff, 0, 0x047, 0, 0)

	CH03("", 0, 0x048, 0, 0)
	Store(DerefOf("b0qv"), Local1)
	CH04("", 0, 0xff, 0, 0x049, 0, 0)
}

/*
 * 6 - Check different ways to pass String (mdac
 * but without Store). Check - no exceptions.
 */
Method(mf8e)
{
	Method(mm60)
	{
		Return("b006")
	}

	Method(mm61, 1)
	{
		Return(arg0)
	}

	Name(b006, Buffer(){ 1, 2, 3, 4, 0x95, 6, 7, 8})
	Name(bb06, Buffer(){ 1, 2, 3, 4, 0x95, 6, 7, 8})
	Name(s006, "b006")
	Name(ss06, "b006")
	Name(i006, 0)


	Store("b006", Local0)
	CopyObject("b006", i006)
	Store(s006, Local7)

	// Checkings

	CH03("", 0, 0x04a, 0, 0)

	DerefOf("b006")

	DerefOf(Local0)

	DerefOf(Local7)

	DerefOf(s006)
	DerefOf(s006)
	DerefOf(s006)
	DerefOf(s006)
	DerefOf(s006)
	DerefOf(s006)
	DerefOf(s006)
	DerefOf(s006)
	DerefOf(s006)

	DerefOf(mm60())

	DerefOf(mm61(ss06))

	DerefOf(ToString("b006"))

	DerefOf(Store("b006", Local6))

	DerefOf(i006)

	CH03("", 0, 0x04b, 0, 0)
}

/*
 * 7 - Check access to special type objects - DerefOf(<String>)
 */
Method(mf8f)
{
	Event(e007)
	Mutex(mx07, 0)
	Device(d007) { Name(i900, 0xabcd0017) }
	ThermalZone(tz07) {}
	Processor(pr07, 0, 0xFFFFFFFF, 0) {}
	OperationRegion(r007, SystemMemory, 0x100, 0x100)
	PowerResource(pw07, 1, 0) {Method(mmmm){return (0)}}

	// Checkings

	CH03("", 0, 0x04c, 0, 0)
	DerefOf("e007")
	CH03("", 0, 0x04d, 0, 0)

	CH03("", 0, 0x04e, 0, 0)
	DerefOf("mx07")
	CH03("", 0, 0x04f, 0, 0)

	CH03("", 0, 0x050, 0, 0)
	DerefOf("d007")
	CH03("", 0, 0x051, 0, 0)

	CH03("", 0, 0x052, 0, 0)
	DerefOf("tz07")
	CH03("", 0, 0x053, 0, 0)

	CH03("", 0, 0x054, 0, 0)
	DerefOf("pr07")
	CH03("", 0, 0x055, 0, 0)

	CH03("", 0, 0x056, 0, 0)
	DerefOf("r007")
	CH03("", 0, 0x057, 0, 0)

	CH03("", 0, 0x058, 0, 0)
	DerefOf("pw07")
	CH03("", 0, 0x059, 0, 0)
}

/*
 * 8 - Check DerefOf(<Not-String>) - calculated type objects
 */
Method(mf90)
{
	Name(b008, Buffer(){ 1, 2, 3, 4, 0x95, 6, 7, 8})
	Name(i008, 0xabbc0000)
	Name(p008, Package() {1,2,3,4})

	// Checkings

	CH03("", 0, 0x05a, 0, 0)
	DerefOf(b008)
	CH04("", 0, 0xff, 0, 0x05b, 0, 0)

	CH03("", 0, 0x05c, 0, 0)
	DerefOf(i008)
	CH04("", 0, 0xff, 0, 0x05d, 0, 0)

	CH03("", 0, 0x05e, 0, 0)
	DerefOf(p008)
	CH04("", 0, 0xff, 0, 0x05f, 0, 0)
}

/*
 * 9 - Check DerefOf(<String>) - but String doesnt refer NameSpace object
 */
Method(mf91)
{
	CH03("", 0, 0x060, 0, 0)
	DerefOf("0123")
	CH04("", 0, 0xff, 0, 0x061, 0, 0)

	CH03("", 0, 0x062, 0, 0)
	DerefOf("zxcvbnm,./;'\][0123")
	CH04("", 0, 0xff, 0, 0x063, 0, 0)

	CH03("", 0, 0x064, 0, 0)
	DerefOf("mf_d")
	CH04("", 0, 0xff, 0, 0x065, 0, 0)

	CH03("", 0, 0x066, 0, 0)
	DerefOf("b009")
	CH04("", 0, 0xff, 0, 0x067, 0, 0)
}

/*
 * a - Check access to special type objects - DerefOf(<String>)
 */
Method(mfa0)
{
	Name(b00a, Buffer() {0xb0,0xb1,0xb2,0xb3,0xb4})
	OperationRegion(r00a, SystemMemory, 0x100, 0x100)

	CreateField(b00a, 8, 8, bfa0)
	Field(r00a, ByteAcc, NoLock, Preserve) {f0a0,8,f0a1,8,f0a2,8,f0a3,8}
	BankField(r00a, f0a1, 0, ByteAcc, NoLock, Preserve) {bna0,4}
	IndexField(f0a2, f0a3, ByteAcc, NoLock, Preserve) {ifa0,8,ifa1,8}

	CH03("", 0, 0x068, 0, 0)

	Store(DerefOf("bfa0"), Local1)
	mf88(Local1, c009, 0xb1, 0x069, 0x06a, 1)

	Store(DerefOf("f0a0"), Local1)
	mf88(Local1, c009, 0, 0x06b, 0x06c, 0)

	Store(DerefOf("f0a1"), Local1)
	mf88(Local1, c009, 0, 0x06d, 0x06e, 0)

	Store(DerefOf("f0a2"), Local1)
	mf88(Local1, c009, 0, 0x06f, 0x070, 0)

	Store(DerefOf("f0a3"), Local1)
	mf88(Local1, c009, 0, 0x071, 0x072, 0)

	Store(DerefOf("bna0"), Local1)
	mf88(Local1, c009, 0, 0x073, 0x074, 0)

	Store(DerefOf("ifa0"), Local1)
	mf88(Local1, c009, 0, 0x075, 0x076, 0)

	Store(DerefOf("ifa1"), Local1)
	mf88(Local1, c009, 0, 0x077, 0x078, 0)

	CH03("", 0, 0x079, 0, 0)
}

// b
Method(mfa1)
{
	Name(b00b, Buffer() {0xb0,0xb1,0xb2,0xb3,0xb4})
	OperationRegion(r00b, SystemMemory, 0x100, 0x100)

	CreateField(b00b, 8, 8, bfb0)
	Field(r00b, ByteAcc, NoLock, Preserve) {f0b0,8,f0b1,8,f0b2,8,f0b3,8}
	BankField(r00b, f0b1, 0, ByteAcc, NoLock, Preserve) {bnb0,4}
	IndexField(f0b2, f0b3, ByteAcc, NoLock, Preserve) {ifb0,8,ifb1,8}

	CH03("", 0, 0x07a, 0, 0)
	Store(DerefOf(bfb0), Local1)
	CH04("", 0, 0xff, 0, 0x07b, 0, 0)

	CH03("", 0, 0x07c, 0, 0)
	Store(DerefOf(f0b0), Local1)
	CH04("", 0, 0xff, 0, 0x07d, 0, 0)

	CH03("", 0, 0x07e, 0, 0)
	Store(DerefOf(f0b1), Local1)
	CH04("", 0, 0xff, 0, 0x07f, 0, 0)

	CH03("", 0, 0x080, 0, 0)
	Store(DerefOf(f0b2), Local1)
	CH04("", 0, 0xff, 0, 0x081, 0, 0)

	CH03("", 0, 0x082, 0, 0)
	Store(DerefOf(f0b3), Local1)
	CH04("", 0, 0xff, 0, 0x083, 0, 0)

	CH03("", 0, 0x084, 0, 0)
	Store(DerefOf(bnb0), Local1)
	CH04("", 0, 0xff, 0, 0x085, 0, 0)

	CH03("", 0, 0x086, 0, 0)
	Store(DerefOf(ifb0), Local1)
	CH04("", 0, 0xff, 0, 0x087, 0, 0)

	CH03("", 0, 0x088, 0, 0)
	Store(DerefOf(ifb1), Local1)
	CH04("", 0, 0xff, 0, 0x089, 0, 0)
}

// c
Method(mfa2)
{
	Event(e00c)
	Mutex(mx0c, 0)
	Device(d00c) { Name(i900, 0xabcd0017) }
	ThermalZone(tz0c) {}
	Processor(pr0c, 0, 0xFFFFFFFF, 0) {}
	OperationRegion(r00c, SystemMemory, 0x100, 0x100)
	PowerResource(pw0c, 1, 0) {Method(mmmm){return (0)}}

	// Checkings

	CH03("", 0, 0x08a, 0, 0)
	DerefOf(e00c)
	CH04("", 0, 0xff, 0, 0x08b, 0, 0)

	CH03("", 0, 0x08c, 0, 0)
	DerefOf(mx0c)
	CH04("", 0, 0xff, 0, 0x08d, 0, 0)

	CH03("", 0, 0x08e, 0, 0)
	DerefOf(d00c)
	CH04("", 0, 0xff, 0, 0x08f, 0, 0)

	CH03("", 0, 0x090, 0, 0)
	DerefOf(tz0c)
	CH04("", 0, 0xff, 0, 0x091, 0, 0)

	CH03("", 0, 0x092, 0, 0)
	DerefOf(pr0c)
	CH04("", 0, 0xff, 0, 0x093, 0, 0)

	CH03("", 0, 0x094, 0, 0)
	DerefOf(r00c)
	CH04("", 0, 0xff, 0, 0x095, 0, 0)

	CH03("", 0, 0x096, 0, 0)
	DerefOf(pw0c)
	CH04("", 0, 0xff, 0, 0x097, 0, 0)
}

Method(m12a)
{
	SRMT("mdac-10")
	mdac()
	SRMT("mf89-10")
	mf89()
	SRMT("mf8a-10")
	mf8a()
	SRMT("mf8b-10")
	mf8b()
	SRMT("mf8c-10")
	mf8c()
	SRMT("mf8d-10")
	mf8d()
	SRMT("mf8e-10")
	mf8e()
	SRMT("mf8f-10")
	mf8f()
	SRMT("mf90-10")
	mf90()
	SRMT("mf91-10")
	mf91()
	SRMT("mfa0-10")
	mfa0()
	SRMT("mfa1-10")
	mfa1()
	SRMT("mfa2-10")
	mfa2()
}
