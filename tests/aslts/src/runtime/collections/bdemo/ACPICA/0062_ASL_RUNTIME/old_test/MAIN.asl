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
 * Bug 0062:
 *
 * COMPONENT: iASL
 *
 * SUMMARY:
 *
 * Crash of ASL compiler...
 */

DefinitionBlock(
	"gr.aml",   // Output filename
	"DSDT",     // Signature
	0x02,       // DSDT Revision
	"Intel",    // OEMID
	"Many",     // TABLE ID
	0x00000001  // OEM Revision
	) {

/*
Method(m000, 1)
{
	Name(s000, "\sq"v")
}
*/

Method(m001, 1)
{
//	Name(s001, "\\sq\"v")
	Name(s002, "\sq"v")
}

/*
Method(m002, 1)
{
	Name(p000, Package() {


		// X - Buffer

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x83,0x84,0x85,0x86,0,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0x83,0x84,0x85,0x86},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x87,0x98,0x99,0x9A,0x9B,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0x87,0x98,0x99,0x9A},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x9C,0x9D,0x9E,0x9F,0xA0,0xA1,0xA2,0xA3},
		Buffer() {0x78,0x56,0x34,0x42,0x9C,0x9D,0x9E,0x9F},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0xA4,0xA5,0xA6,0xA7,0xB8,0xB9,0xBA,0xBB},
		Buffer() {0x78,0x56,0x34,0x42,0xA4,0xA5,0xA6,0xA7},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x91,0x92,0x93,0x94,0x5F,0x60,0x61,0x62},
		Buffer() {0x78,0x56,0x34,0x42,0x91,0x92,0x93,0x94},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				1,2,3,4,5,6,7,8},
		Buffer() {0x78,0x56,0x34,0x42,1,2,3,4},

		// X - Field Unit

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x7f,0,0,0,0,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0x7f,0,0,0},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x07,0,0,0,0,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0x07,0,0,0},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x8d,0,0,0,0,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0x8d,0,0,0},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x8d,0x8c,0,0,0,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0x8d,0x8c,0,0},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x8D,0x8C,0x8B,0x8A,0,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0x8D,0x8C,0x8B,0x8A},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0xFF,0xFF,0xFF,0xFF,0x01,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0xFF,0xFF,0xFF,0xFF},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x58,0x46,0x37,0x88,0x19,0xFA,0xDE,0x5C},
		Buffer() {0x78,0x56,0x34,0x42,0x58,0x46,0x37,0x88},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x58,0x9a,0x37,0x88,0x19,0xFA,0xDE,0xDC},
		Buffer() {0x78,0x56,0x34,0x42,0x58,0x9a,0x37,0x88},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x58,0xc7,0x37,0x88,0x19,0xFA,0xDE,0xDC},
		Buffer() {0x78,0x56,0x34,0x42,0x58,0xc7,0x37,0x88},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x82,0x34,0x56,0x78,0x90,0xAB,0xCD,0xEF},
		Buffer() {0x78,0x56,0x34,0x42,0x82,0x34,0x56,0x78},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x93,0xAB,0xCD,0xEF,0x99,0x12,0xCD,0x52},
		Buffer() {0x78,0x56,0x34,0x42,0x93,0xAB,0xCD,0xEF},

		// X - Buffer Field

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0xAB,0x54,0x86,0x91,0,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0xAB,0x54,0x86,0x91},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x07,0,0,0,0,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0x07,0,0,0},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x8d,0,0,0,0,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0x8d,0,0,0},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x8d,0x8c,0,0,0,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0x8d,0x8c,0,0},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x8D,0x8C,0x8B,0x8A,0,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0x8D,0x8C,0x8B,0x8A},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0xFF,0xFF,0xFF,0xFF,0x01,0,0,0},
		Buffer() {0x78,0x56,0x34,0x42,0xFF,0xFF,0xFF,0xFF},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x58,0x46,0x37,0x88,0x19,0xFA,0xDE,0x5C},
		Buffer() {0x78,0x56,0x34,0x42,0x58,0x46,0x37,0x88},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x58,0x9a,0x37,0x88,0x19,0xFA,0xDE,0xDC},
		Buffer() {0x78,0x56,0x34,0x42,0x58,0x9a,0x37,0x88},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x58,0xc7,0x37,0x88,0x19,0xFA,0xDE,0xDC},
		Buffer() {0x78,0x56,0x34,0x42,0x58,0xc7,0x37,0x88},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x82,0x34,0x56,0x78,0x90,0xAB,0xCD,0xEF},
		Buffer() {0x78,0x56,0x34,0x42,0x82,0x34,0x56,0x78},

		Buffer() {0x78,0x56,0x34,0x42,0x89,0xF1,0xED,0xAB,
				0x93,0xAB,0xCD,0xEF,0x99,0x12,0xCD,0x52},
		Buffer() {0x78,0x56,0x34,0x42,0x93,0xAB,0xCD,0xEF},
		})
}
*/

}
