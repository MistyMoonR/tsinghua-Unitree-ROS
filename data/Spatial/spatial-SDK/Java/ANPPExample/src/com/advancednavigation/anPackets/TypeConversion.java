/****************************************************************/
/*                                                              */
/*      Advanced Navigation Packet Protocol Library             */
/*            Java Language SDK, Version 4.0                    */
/*   Copyright 2014, Xavier Orr, Advanced Navigation Pty Ltd    */
/*                                                              */
/****************************************************************/
/*
 * Copyright (C) 2014 Advanced Navigation Pty Ltd
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

package com.advancednavigation.anPackets;

public class TypeConversion 
{
	public static int bytesToUInt16(byte[] data, int offset)
	{
		return data[offset]&0xFF | (data[offset+1]&0xFF)<<8;
	}
	
	public static int bytesToInt16(byte[] data, int offset)
	{
		return (short)(data[offset]&0xFF | (data[offset+1]&0xFF)<<8);
	}
	
	public static long bytesToUInt32(byte[] data, int offset)
	{
		return (data[offset]&0xFF | (data[offset+1]&0xFF)<<8 | (data[offset+2]&0xFF)<<16 | (data[offset+3]&0xFF)<<24)&0xFFFFFFFFL;
	}
	
	public static int bytesToInt32(byte[] data, int offset)
	{
		return data[offset]&0xFF | (data[offset+1]&0xFF)<<8 | (data[offset+2]&0xFF)<<16 | (data[offset+3]&0xFF)<<24;
	}
	
	public static long bytesToInt64(byte[] data, int offset)
	{
		return data[offset]&0xFFL | (data[offset+1]&0xFFL)<<8 | (data[offset+2]&0xFFL)<<16 | (data[offset+3]&0xFFL)<<24 | (data[offset+4]&0xFFL)<<32 | (data[offset+5]&0xFFL)<<40 | (data[offset+6]&0xFFL)<<48 | (data[offset+7]&0xFFL)<<56;
	}
	
	public static float bytesToFloat(byte[] data, int offset)
	{
		int temp = bytesToInt32(data,offset);
		return Float.intBitsToFloat(temp);
	}
	
	public static double bytesToDouble(byte[] data, int offset)
	{
		long temp = bytesToInt64(data,offset);
		return Double.longBitsToDouble(temp);
	}
	
	public static void int16ToBytes(byte[] data, int offset, int number)
	{
		short value = (short)number;
		data[offset] = (byte)(value&0xFF);
		data[offset+1] = (byte)((value>>>8)&0xFF);
	}
	
	public static void int32ToBytes(byte[] data, int offset, int number)
	{
		data[offset] = (byte)(number&0xFF);
		data[offset+1] = (byte)((number>>>8)&0xFF);
		data[offset+2] = (byte)((number>>>16)&0xFF);
		data[offset+3] = (byte)((number>>>24)&0xFF);
	}
	
	public static void floatToBytes(byte[] data, int offset, float number)
	{
		int value = Float.floatToIntBits(number);
		data[offset] = (byte)(value&0xFF);
		data[offset+1] = (byte)((value>>>8)&0xFF);
		data[offset+2] = (byte)((value>>>16)&0xFF);
		data[offset+3] = (byte)((value>>>24)&0xFF);
	}
	
	public static void doubleToBytes(byte[] data, int offset, double number)
	{
		long value = Double.doubleToLongBits(number);
		data[offset] = (byte)(value&0xFF);
		data[offset+1] = (byte)((value>>>8)&0xFF);
		data[offset+2] = (byte)((value>>>16)&0xFF);
		data[offset+3] = (byte)((value>>>24)&0xFF);
		data[offset+4] = (byte)((value>>>32)&0xFF);
		data[offset+5] = (byte)((value>>>40)&0xFF);
		data[offset+6] = (byte)((value>>>48)&0xFF);
		data[offset+7] = (byte)((value>>>56)&0xFF);
	}
}
