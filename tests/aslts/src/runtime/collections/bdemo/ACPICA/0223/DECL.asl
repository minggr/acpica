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
 * Bug 223:
 *
 * SUMMARY: DataTableRegion with the non-constant *String arguments
 *          unexpectedly causes an exception or crash
 */

Device(D223) {
	DataTableRegion (DR00, "SSDT", "", "")
	Field(DR00, AnyAcc, NoLock, Preserve) {
		FU00, 0x180}
}

Method(m10b)
{
	Name(SSDT, Buffer(0x30){
		0x53,0x53,0x44,0x54,0x30,0x00,0x00,0x00,
		0x01,0xB8,0x49,0x6E,0x74,0x65,0x6C,0x00,
		0x4D,0x61,0x6E,0x79,0x00,0x00,0x00,0x00,
		0x01,0x00,0x00,0x00,0x49,0x4E,0x54,0x4C,
		0x24,0x04,0x03,0x20,0x14,0x0B,0x5F,0x54,
		0x39,0x38,0x00,0x70,0x0A,0x04,0x60,0xA4,
	})

	Method(CHCK, 3)
	{
		if (LNotEqual(arg0, arg1)) {
			err("", zFFF, arg2, 0, 0, arg0, arg1)
		}
	}

	Method(m000, 1) {
		DataTableRegion (DR00, "SSDT", "", "")

		Field(DR00, AnyAcc, NoLock, Preserve) {
			FU00, 0x180}

		CHCK(FU00, SSDT, arg0)
	}

	Method(m001, 4) {
		DataTableRegion (DR00, arg0, arg1, arg2)

		Field(DR00, AnyAcc, NoLock, Preserve) {
			FU00, 0x180}

		CHCK(FU00, SSDT, arg3)
	}

	Name(s000, "SSDT")
	Name(s001, "")
	Name(s002, "")

	Method(m002, 1) {
		DataTableRegion (DR00, s000, s001, s002)

		Field(DR00, AnyAcc, NoLock, Preserve) {
			FU00, 0x180}

		CHCK(FU00, SSDT, arg0)
	}

	CHCK(\D223.FU00, SSDT, 0)

	m000(1)

	if (1) {
		m001("SSDT", "", "", 2)
	} else {
		m002(3)
	}
}
