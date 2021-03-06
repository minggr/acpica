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
 * Bug 124:
 *
 * SUMMARY: No exception when the Index argument on Index() operator is out of the Source
 */

	Method(mf06)
	{
		Name(p000, Package(2){0, 1})
		Name(b000, Buffer(3){2, 3, 4})
		Name(s000, "5678")

		// a) Index > 0xffffffff
		// c) Modulo(Index, 0x100000000) < Size.

		CH03("", 0, 0x000, 0, 0)
		Index(p000, 0x100000001)
		CH04("", 0, 55, 0, 0x001, 0, 0) // AE_AML_PACKAGE_LIMIT

		CH03("", 0, 0x002, 0, 0)
		Index(b000, 0x100000002)
		CH04("", 0, 54, 0, 0x003, 0, 0) // AE_AML_BUFFER_LIMIT

		CH03("", 0, 0x004, 0, 0)
		Index(s000, 0x100000003)
		CH04("", 0, 61, 0, 0x005, 0, 0) // AE_AML_STRING_LIMIT
	}


