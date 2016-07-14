unit uRIPEMD160;

interface

uses
{$IFDEF DELPHI2010}
  SysUtils, // to get rid of compiler hint "not inlined" on Delphi 2010.
{$ENDIF DELPHI2010}
  uHashLibTypes,
  uMDBase,
  uConverters,
  uIHashInfo;

type
  TRIPEMD160 = class sealed(TMDBase, ITransformBlock)

  strict protected
    procedure TransformBlock(a_data: THashLibByteArray;
      a_index: Int32); override;

  public
    constructor Create();
    procedure Initialize(); override;

  end;

implementation

{ TRIPEMD160 }

constructor TRIPEMD160.Create;
begin
  Inherited Create(5, 20);
end;

procedure TRIPEMD160.Initialize;
begin
  Fm_state[4] := $C3D2E1F0;

  Inherited Initialize();

end;

procedure TRIPEMD160.TransformBlock(a_data: THashLibByteArray; a_index: Int32);
var
  data0, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10,
    data11, data12, data13, data14, data15, a, b, c, d, e, aa, bb, cc, dd,
    ee: UInt32;
begin
  data0 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 0);
  data1 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 1);
  data2 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 2);
  data3 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 3);
  data4 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 4);
  data5 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 5);
  data6 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 6);
  data7 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 7);
  data8 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 8);
  data9 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 9);
  data10 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 10);
  data11 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 11);
  data12 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 12);
  data13 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 13);
  data14 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 14);
  data15 := TConverters.ConvertBytesToUInt32a2(a_data, a_index + 4 * 15);

  a := Fm_state[0];
  b := Fm_state[1];
  c := Fm_state[2];
  d := Fm_state[3];
  e := Fm_state[4];
  aa := a;
  bb := b;
  cc := c;
  dd := d;
  ee := e;

  a := a + (data0 + (b xor c xor d));
  a := ((a shl 11) or (a shr (32 - 11))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data1 + (a xor b xor c));
  e := ((e shl 14) or (e shr (32 - 14))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data2 + (e xor a xor b));
  d := ((d shl 15) or (d shr (32 - 15))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data3 + (d xor e xor a));
  c := ((c shl 12) or (c shr (32 - 12))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data4 + (c xor d xor e));
  b := ((b shl 5) or (b shr (32 - 5))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data5 + (b xor c xor d));
  a := ((a shl 8) or (a shr (32 - 8))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data6 + (a xor b xor c));
  e := ((e shl 7) or (e shr (32 - 7))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data7 + (e xor a xor b));
  d := ((d shl 9) or (d shr (32 - 9))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data8 + (d xor e xor a));
  c := ((c shl 11) or (c shr (32 - 11))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data9 + (c xor d xor e));
  b := ((b shl 13) or (b shr (32 - 13))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data10 + (b xor c xor d));
  a := ((a shl 14) or (a shr (32 - 14))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data11 + (a xor b xor c));
  e := ((e shl 15) or (e shr (32 - 15))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data12 + (e xor a xor b));
  d := ((d shl 6) or (d shr (32 - 6))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data13 + (d xor e xor a));
  c := ((c shl 7) or (c shr (32 - 7))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data14 + (c xor d xor e));
  b := ((b shl 9) or (b shr (32 - 9))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data15 + (b xor c xor d));
  a := ((a shl 8) or (a shr (32 - 8))) + e;
  c := (c shl 10) or (c shr (32 - 10));

  aa := aa + (data5 + C1 + (bb xor (cc or not dd)));
  aa := ((aa shl 8) or (aa shr (32 - 8))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data14 + C1 + (aa xor (bb or not cc)));
  ee := ((ee shl 9) or (ee shr (32 - 9))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data7 + C1 + (ee xor (aa or not bb)));
  dd := ((dd shl 9) or (dd shr (32 - 9))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data0 + C1 + (dd xor (ee or not aa)));
  cc := ((cc shl 11) or (cc shr (32 - 11))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data9 + C1 + (cc xor (dd or not ee)));
  bb := ((bb shl 13) or (bb shr (32 - 13))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data2 + C1 + (bb xor (cc or not dd)));
  aa := ((aa shl 15) or (aa shr (32 - 15))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data11 + C1 + (aa xor (bb or not cc)));
  ee := ((ee shl 15) or (ee shr (32 - 15))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data4 + C1 + (ee xor (aa or not bb)));
  dd := ((dd shl 5) or (dd shr (32 - 5))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data13 + C1 + (dd xor (ee or not aa)));
  cc := ((cc shl 7) or (cc shr (32 - 7))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data6 + C1 + (cc xor (dd or not ee)));
  bb := ((bb shl 7) or (bb shr (32 - 7))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data15 + C1 + (bb xor (cc or not dd)));
  aa := ((aa shl 8) or (aa shr (32 - 8))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data8 + C1 + (aa xor (bb or not cc)));
  ee := ((ee shl 11) or (ee shr (32 - 11))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data1 + C1 + (ee xor (aa or not bb)));
  dd := ((dd shl 14) or (dd shr (32 - 14))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data10 + C1 + (dd xor (ee or not aa)));
  cc := ((cc shl 14) or (cc shr (32 - 14))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data3 + C1 + (cc xor (dd or not ee)));
  bb := ((bb shl 12) or (bb shr (32 - 12))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data12 + C1 + (bb xor (cc or not dd)));
  aa := ((aa shl 6) or (aa shr (32 - 6))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));

  e := e + (data7 + C2 + ((a and b) or (not a and c)));
  e := ((e shl 7) or (e shr (32 - 7))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data4 + C2 + ((e and a) or (not e and b)));
  d := ((d shl 6) or (d shr (32 - 6))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data13 + C2 + ((d and e) or (not d and a)));
  c := ((c shl 8) or (c shr (32 - 8))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data1 + C2 + ((c and d) or (not c and e)));
  b := ((b shl 13) or (b shr (32 - 13))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data10 + C2 + ((b and c) or (not b and d)));
  a := ((a shl 11) or (a shr (32 - 11))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data6 + C2 + ((a and b) or (not a and c)));
  e := ((e shl 9) or (e shr (32 - 9))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data15 + C2 + ((e and a) or (not e and b)));
  d := ((d shl 7) or (d shr (32 - 7))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data3 + C2 + ((d and e) or (not d and a)));
  c := ((c shl 15) or (c shr (32 - 15))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data12 + C2 + ((c and d) or (not c and e)));
  b := ((b shl 7) or (b shr (32 - 7))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data0 + C2 + ((b and c) or (not b and d)));
  a := ((a shl 12) or (a shr (32 - 12))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data9 + C2 + ((a and b) or (not a and c)));
  e := ((e shl 15) or (e shr (32 - 15))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data5 + C2 + ((e and a) or (not e and b)));
  d := ((d shl 9) or (d shr (32 - 9))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data2 + C2 + ((d and e) or (not d and a)));
  c := ((c shl 11) or (c shr (32 - 11))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data14 + C2 + ((c and d) or (not c and e)));
  b := ((b shl 7) or (b shr (32 - 7))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data11 + C2 + ((b and c) or (not b and d)));
  a := ((a shl 13) or (a shr (32 - 13))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data8 + C2 + ((a and b) or (not a and c)));
  e := ((e shl 12) or (e shr (32 - 12))) + d;
  b := (b shl 10) or (b shr (32 - 10));

  ee := ee + (data6 + C3 + ((aa and cc) or (bb and not cc)));
  ee := ((ee shl 9) or (ee shr (32 - 9))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data11 + C3 + ((ee and bb) or (aa and not bb)));
  dd := ((dd shl 13) or (dd shr (32 - 13))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data3 + C3 + ((dd and aa) or (ee and not aa)));
  cc := ((cc shl 15) or (cc shr (32 - 15))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data7 + C3 + ((cc and ee) or (dd and not ee)));
  bb := ((bb shl 7) or (bb shr (32 - 7))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data0 + C3 + ((bb and dd) or (cc and not dd)));
  aa := ((aa shl 12) or (aa shr (32 - 12))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data13 + C3 + ((aa and cc) or (bb and not cc)));
  ee := ((ee shl 8) or (ee shr (32 - 8))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data5 + C3 + ((ee and bb) or (aa and not bb)));
  dd := ((dd shl 9) or (dd shr (32 - 9))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data10 + C3 + ((dd and aa) or (ee and not aa)));
  cc := ((cc shl 11) or (cc shr (32 - 11))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data14 + C3 + ((cc and ee) or (dd and not ee)));
  bb := ((bb shl 7) or (bb shr (32 - 7))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data15 + C3 + ((bb and dd) or (cc and not dd)));
  aa := ((aa shl 7) or (aa shr (32 - 7))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data8 + C3 + ((aa and cc) or (bb and not cc)));
  ee := ((ee shl 12) or (ee shr (32 - 12))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data12 + C3 + ((ee and bb) or (aa and not bb)));
  dd := ((dd shl 7) or (dd shr (32 - 7))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data4 + C3 + ((dd and aa) or (ee and not aa)));
  cc := ((cc shl 6) or (cc shr (32 - 6))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data9 + C3 + ((cc and ee) or (dd and not ee)));
  bb := ((bb shl 15) or (bb shr (32 - 15))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data1 + C3 + ((bb and dd) or (cc and not dd)));
  aa := ((aa shl 13) or (aa shr (32 - 13))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data2 + C3 + ((aa and cc) or (bb and not cc)));
  ee := ((ee shl 11) or (ee shr (32 - 11))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));

  d := d + (data3 + C4 + ((e or not a) xor b));
  d := ((d shl 11) or (d shr (32 - 11))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data10 + C4 + ((d or not e) xor a));
  c := ((c shl 13) or (c shr (32 - 13))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data14 + C4 + ((c or not d) xor e));
  b := ((b shl 6) or (b shr (32 - 6))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data4 + C4 + ((b or not c) xor d));
  a := ((a shl 7) or (a shr (32 - 7))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data9 + C4 + ((a or not b) xor c));
  e := ((e shl 14) or (e shr (32 - 14))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data15 + C4 + ((e or not a) xor b));
  d := ((d shl 9) or (d shr (32 - 9))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data8 + C4 + ((d or not e) xor a));
  c := ((c shl 13) or (c shr (32 - 13))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data1 + C4 + ((c or not d) xor e));
  b := ((b shl 15) or (b shr (32 - 15))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data2 + C4 + ((b or not c) xor d));
  a := ((a shl 14) or (a shr (32 - 14))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data7 + C4 + ((a or not b) xor c));
  e := ((e shl 8) or (e shr (32 - 8))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data0 + C4 + ((e or not a) xor b));
  d := ((d shl 13) or (d shr (32 - 13))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data6 + C4 + ((d or not e) xor a));
  c := ((c shl 6) or (c shr (32 - 6))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data13 + C4 + ((c or not d) xor e));
  b := ((b shl 5) or (b shr (32 - 5))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data11 + C4 + ((b or not c) xor d));
  a := ((a shl 12) or (a shr (32 - 12))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data5 + C4 + ((a or not b) xor c));
  e := ((e shl 7) or (e shr (32 - 7))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data12 + C4 + ((e or not a) xor b));
  d := ((d shl 5) or (d shr (32 - 5))) + c;
  a := (a shl 10) or (a shr (32 - 10));

  dd := dd + (data15 + C5 + ((ee or not aa) xor bb));
  dd := ((dd shl 9) or (dd shr (32 - 9))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data5 + C5 + ((dd or not ee) xor aa));
  cc := ((cc shl 7) or (cc shr (32 - 7))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data1 + C5 + ((cc or not dd) xor ee));
  bb := ((bb shl 15) or (bb shr (32 - 15))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data3 + C5 + ((bb or not cc) xor dd));
  aa := ((aa shl 11) or (aa shr (32 - 11))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data7 + C5 + ((aa or not bb) xor cc));
  ee := ((ee shl 8) or (ee shr (32 - 8))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data14 + C5 + ((ee or not aa) xor bb));
  dd := ((dd shl 6) or (dd shr (32 - 6))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data6 + C5 + ((dd or not ee) xor aa));
  cc := ((cc shl 6) or (cc shr (32 - 6))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data9 + C5 + ((cc or not dd) xor ee));
  bb := ((bb shl 14) or (bb shr (32 - 14))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data11 + C5 + ((bb or not cc) xor dd));
  aa := ((aa shl 12) or (aa shr (32 - 12))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data8 + C5 + ((aa or not bb) xor cc));
  ee := ((ee shl 13) or (ee shr (32 - 13))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data12 + C5 + ((ee or not aa) xor bb));
  dd := ((dd shl 5) or (dd shr (32 - 5))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data2 + C5 + ((dd or not ee) xor aa));
  cc := ((cc shl 14) or (cc shr (32 - 14))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data10 + C5 + ((cc or not dd) xor ee));
  bb := ((bb shl 13) or (bb shr (32 - 13))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data0 + C5 + ((bb or not cc) xor dd));
  aa := ((aa shl 13) or (aa shr (32 - 13))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data4 + C5 + ((aa or not bb) xor cc));
  ee := ((ee shl 7) or (ee shr (32 - 7))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data13 + C5 + ((ee or not aa) xor bb));
  dd := ((dd shl 5) or (dd shr (32 - 5))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));

  c := c + (data1 + C6 + ((d and a) or (e and not a)));
  c := ((c shl 11) or (c shr (32 - 11))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data9 + C6 + ((c and e) or (d and not e)));
  b := ((b shl 12) or (b shr (32 - 12))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data11 + C6 + ((b and d) or (c and not d)));
  a := ((a shl 14) or (a shr (32 - 14))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data10 + C6 + ((a and c) or (b and not c)));
  e := ((e shl 15) or (e shr (32 - 15))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data0 + C6 + ((e and b) or (a and not b)));
  d := ((d shl 14) or (d shr (32 - 14))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data8 + C6 + ((d and a) or (e and not a)));
  c := ((c shl 15) or (c shr (32 - 15))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data12 + C6 + ((c and e) or (d and not e)));
  b := ((b shl 9) or (b shr (32 - 9))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data4 + C6 + ((b and d) or (c and not d)));
  a := ((a shl 8) or (a shr (32 - 8))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data13 + C6 + ((a and c) or (b and not c)));
  e := ((e shl 9) or (e shr (32 - 9))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data3 + C6 + ((e and b) or (a and not b)));
  d := ((d shl 14) or (d shr (32 - 14))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data7 + C6 + ((d and a) or (e and not a)));
  c := ((c shl 5) or (c shr (32 - 5))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data15 + C6 + ((c and e) or (d and not e)));
  b := ((b shl 6) or (b shr (32 - 6))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data14 + C6 + ((b and d) or (c and not d)));
  a := ((a shl 8) or (a shr (32 - 8))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data5 + C6 + ((a and c) or (b and not c)));
  e := ((e shl 6) or (e shr (32 - 6))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data6 + C6 + ((e and b) or (a and not b)));
  d := ((d shl 5) or (d shr (32 - 5))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data2 + C6 + ((d and a) or (e and not a)));
  c := ((c shl 12) or (c shr (32 - 12))) + b;
  e := (e shl 10) or (e shr (32 - 10));

  cc := cc + (data8 + C7 + ((dd and ee) or (not dd and aa)));
  cc := ((cc shl 15) or (cc shr (32 - 15))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data6 + C7 + ((cc and dd) or (not cc and ee)));
  bb := ((bb shl 5) or (bb shr (32 - 5))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data4 + C7 + ((bb and cc) or (not bb and dd)));
  aa := ((aa shl 8) or (aa shr (32 - 8))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data1 + C7 + ((aa and bb) or (not aa and cc)));
  ee := ((ee shl 11) or (ee shr (32 - 11))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data3 + C7 + ((ee and aa) or (not ee and bb)));
  dd := ((dd shl 14) or (dd shr (32 - 14))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data11 + C7 + ((dd and ee) or (not dd and aa)));
  cc := ((cc shl 14) or (cc shr (32 - 14))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data15 + C7 + ((cc and dd) or (not cc and ee)));
  bb := ((bb shl 6) or (bb shr (32 - 6))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data0 + C7 + ((bb and cc) or (not bb and dd)));
  aa := ((aa shl 14) or (aa shr (32 - 14))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data5 + C7 + ((aa and bb) or (not aa and cc)));
  ee := ((ee shl 6) or (ee shr (32 - 6))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data12 + C7 + ((ee and aa) or (not ee and bb)));
  dd := ((dd shl 9) or (dd shr (32 - 9))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data2 + C7 + ((dd and ee) or (not dd and aa)));
  cc := ((cc shl 12) or (cc shr (32 - 12))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data13 + C7 + ((cc and dd) or (not cc and ee)));
  bb := ((bb shl 9) or (bb shr (32 - 9))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data9 + C7 + ((bb and cc) or (not bb and dd)));
  aa := ((aa shl 12) or (aa shr (32 - 12))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data7 + C7 + ((aa and bb) or (not aa and cc)));
  ee := ((ee shl 5) or (ee shr (32 - 5))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data10 + C7 + ((ee and aa) or (not ee and bb)));
  dd := ((dd shl 15) or (dd shr (32 - 15))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data14 + C7 + ((dd and ee) or (not dd and aa)));
  cc := ((cc shl 8) or (cc shr (32 - 8))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));

  b := b + (data4 + C8 + (c xor (d or not e)));
  b := ((b shl 9) or (b shr (32 - 9))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data0 + C8 + (b xor (c or not d)));
  a := ((a shl 15) or (a shr (32 - 15))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data5 + C8 + (a xor (b or not c)));
  e := ((e shl 5) or (e shr (32 - 5))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data9 + C8 + (e xor (a or not b)));
  d := ((d shl 11) or (d shr (32 - 11))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data7 + C8 + (d xor (e or not a)));
  c := ((c shl 6) or (c shr (32 - 6))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data12 + C8 + (c xor (d or not e)));
  b := ((b shl 8) or (b shr (32 - 8))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data2 + C8 + (b xor (c or not d)));
  a := ((a shl 13) or (a shr (32 - 13))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data10 + C8 + (a xor (b or not c)));
  e := ((e shl 12) or (e shr (32 - 12))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data14 + C8 + (e xor (a or not b)));
  d := ((d shl 5) or (d shr (32 - 5))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data1 + C8 + (d xor (e or not a)));
  c := ((c shl 12) or (c shr (32 - 12))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data3 + C8 + (c xor (d or not e)));
  b := ((b shl 13) or (b shr (32 - 13))) + a;
  d := (d shl 10) or (d shr (32 - 10));
  a := a + (data8 + C8 + (b xor (c or not d)));
  a := ((a shl 14) or (a shr (32 - 14))) + e;
  c := (c shl 10) or (c shr (32 - 10));
  e := e + (data11 + C8 + (a xor (b or not c)));
  e := ((e shl 11) or (e shr (32 - 11))) + d;
  b := (b shl 10) or (b shr (32 - 10));
  d := d + (data6 + C8 + (e xor (a or not b)));
  d := ((d shl 8) or (d shr (32 - 8))) + c;
  a := (a shl 10) or (a shr (32 - 10));
  c := c + (data15 + C8 + (d xor (e or not a)));
  c := ((c shl 5) or (c shr (32 - 5))) + b;
  e := (e shl 10) or (e shr (32 - 10));
  b := b + (data13 + C8 + (c xor (d or not e)));
  b := ((b shl 6) or (b shr (32 - 6))) + a;
  d := (d shl 10) or (d shr (32 - 10));

  bb := bb + (data12 + (cc xor dd xor ee));
  bb := ((bb shl 8) or (bb shr (32 - 8))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data15 + (bb xor cc xor dd));
  aa := ((aa shl 5) or (aa shr (32 - 5))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data10 + (aa xor bb xor cc));
  ee := ((ee shl 12) or (ee shr (32 - 12))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data4 + (ee xor aa xor bb));
  dd := ((dd shl 9) or (dd shr (32 - 9))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data1 + (dd xor ee xor aa));
  cc := ((cc shl 12) or (cc shr (32 - 12))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data5 + (cc xor dd xor ee));
  bb := ((bb shl 5) or (bb shr (32 - 5))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data8 + (bb xor cc xor dd));
  aa := ((aa shl 14) or (aa shr (32 - 14))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data7 + (aa xor bb xor cc));
  ee := ((ee shl 6) or (ee shr (32 - 6))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data6 + (ee xor aa xor bb));
  dd := ((dd shl 8) or (dd shr (32 - 8))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data2 + (dd xor ee xor aa));
  cc := ((cc shl 13) or (cc shr (32 - 13))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data13 + (cc xor dd xor ee));
  bb := ((bb shl 6) or (bb shr (32 - 6))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));
  aa := aa + (data14 + (bb xor cc xor dd));
  aa := ((aa shl 5) or (aa shr (32 - 5))) + ee;
  cc := (cc shl 10) or (cc shr (32 - 10));
  ee := ee + (data0 + (aa xor bb xor cc));
  ee := ((ee shl 15) or (ee shr (32 - 15))) + dd;
  bb := (bb shl 10) or (bb shr (32 - 10));
  dd := dd + (data3 + (ee xor aa xor bb));
  dd := ((dd shl 13) or (dd shr (32 - 13))) + cc;
  aa := (aa shl 10) or (aa shr (32 - 10));
  cc := cc + (data9 + (dd xor ee xor aa));
  cc := ((cc shl 11) or (cc shr (32 - 11))) + bb;
  ee := (ee shl 10) or (ee shr (32 - 10));
  bb := bb + (data11 + (cc xor dd xor ee));
  bb := ((bb shl 11) or (bb shr (32 - 11))) + aa;
  dd := (dd shl 10) or (dd shr (32 - 10));

  dd := dd + c + Fm_state[1];
  Fm_state[1] := Fm_state[2] + d + ee;
  Fm_state[2] := Fm_state[3] + e + aa;
  Fm_state[3] := Fm_state[4] + a + bb;
  Fm_state[4] := Fm_state[0] + b + cc;
  Fm_state[0] := dd;

end;

end.
