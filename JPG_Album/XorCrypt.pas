unit XorCrypt;

(*****************************************************************************
 *****************************************************************************

    �����������:              Alegun
    E-Mail:                   alegun72@mail.ru
    ���� ��������:            8 ������� 1999 ����

 *****************************************************************************
 *****************************************************************************

    �����������/������������� ������.

 -----------------------------------------------------------------------------
    ��������������: ������ �������� �� �������� ���������� ����������������.
 -----------------------------------------------------------------------------

 *****************************************************************************
 *****************************************************************************

  ��� ��� �� ���������

  �e�a��o ��� o�a�a�e�  ���o�o���  �a �e�y ����o�a��� �xo���x �a�o�e� �
 �o�a��e (�O �oc�y�a �e��a�o �x � �eec��e ����o� o�������  �e�c�o�, ���
 � ������������ ��������� "�����������" ������������), �ec�a��, �oc�a��
 ����o�a��� � �o��c��ee. "�� ��e, �e�!" - ������, o�����a� Culib�1.06 -
 "Co�e�� �� ������" ��������� �������, �axo�y �a��e� "�o���o�a��e ����"
 � ���� co�e� "Encrypt/Decrypt c��o��". ��acc! ��c��e���o �o����� ��o��
 - � �e���� �ce ��ea���o �a�o�ae�.�o c�o��o �o���o �o�������� � ��oe��y
 TRegistry, �a� c�a�y �o��� ��������� - �o �a�o�� o��e�a�o,�o o��e����e
 ��a�� �c�e�a��, ������ �� ������ ������ ��������.
  �o�a�� �o�o�y oco�o �e �����oc� - o�a�a�oc� �o �ce� ���o�a�  chr(#0).
 �o ����������� ��o �e�� ��a� o�o��a��� c��o��, �o� OS� � o��e�a�a �c�,
 ��o �oc�e �e�o. ��������� ���� �o��e���� #0 �a �a���e ��a��.

 A��o���� ����o�a��� ����e��o �a�o�:���y�ae� c�y�a���� ����,�oc�e�c��o�
 XOR �e�ae� ���� � �e�c�,��o�e��e� �a �a����e #0. Ec�� ec�� �a�a� �e�a,
 �o �a�e��e� e� �a ����� �a�y ��a�o� (�1 � �2) � c�e�y��e� �a��c��oc��:

   ec�� �1 = �o �1+�2 (��� �e����o��e �1+�2 = �1)
   ec�� �2 = �o �2+�1 (��� �e����o��e �2+�1 = �2)
   ec�� #0 = �o �1+�1 ��� �2+�2
                      (��� �e����o��e ��a �1 ��� �2 �o���� ���a�a�� #0)

  �a�e� �e�e�ye� ���� � ����o��y � �ax�a��o�  �o����e, �o�a���e� �e����
 ��a�o�  �o�y����e�c� c��o�� ����y ����a, � ��o ��  �o��e�c��o�a�� ����
 ���-�� ���������oc�� �����o�a���(����-�� �o�y�ae�c� �o��oc��� o�������)
 �e�� ��o� �������� e�e  �a��� ��o�yc�ae� �e�e� XOR � �o�o�e��e ��a�a �
 c��o�e.

  �������� �o�e��o,�o �a�o ����o����a �a ��xo�e �a���� �a� o����ae��� �
 �a��e�o�, � co�e��a��e�. ����� c TRegistry  ������ �e �a����a��c�, ��o
 ������������ �������� ������ ��e�o� � �������.

 *****************************************************************************
 *****************************************************************************)

interface

uses
    SysUtils, Math;

 function EnCrypt(ds: string): string;
 function DeCrypt(ds: string): string;

 implementation

 const { ��������� �� #0. ����� �� #1-#255, ����������� ������. }

        zn1 = #60; { < }
        zn2 = #62; { > }

 function EnCrypt(ds: string): string;
  var k,l,m: string; i,b,g: integer; t: char;
   function Lvs(ds: byte): string;
   begin
    case ds of Byte(zn1): Result:= zn1+zn2;Byte(zn2): Result:= zn2+zn1;
         0: if Random(2)=0 then Result:= zn1+zn1 else Result:= zn2+zn2;
           else Result:= Chr(ds);end;
   end;
  begin
   if length(ds)=0 then Exit; Randomize; k:=''; m:=''; b:=1;
   for i:=1 to RandomRange(5,16) do k:= k+Chr(RandomRange(1,256));
   for i:=1 to Length(ds) do  begin g:= Byte(ds[i])xor Byte(k[b]);
   l:=Lvs(g);t:=k[b];if i<=Length(k)then m:=m+t+l else m:=m+l;Inc(b);
   if b>Length(k) then b:= 1; end; l:= Chr(Length(k))+m;
   for  i:=1 to Length(l) do begin b:= Byte(l[I]) xor i;k:= Lvs(b);
   Result:= Result+k; end;
  end;

 function DeCrypt(ds: string): string;
  var k,c,l,n: string; i,b,m: integer; d: boolean;
   function Svl(ds: string; ts: integer): char;
   var t: byte;
   begin
    t:=Byte(ds[1]);
    if ds=zn1+zn2 then t:=Byte(zn1);if ds=zn2+zn1 then t:=Byte(zn2);
    if(ds=zn1+zn1) or (ds=zn2+zn2) then t:= 0;Result:=Chr(Byte(t xor ts));
   end;
  begin
   if length(ds)=0 then Exit; b:=1; i:=1; n:='';
   while i<=Length(ds) do begin c:= ds[i];
   if (ds[i]=zn1)or(ds[i]=zn2)then begin c:=ds[i]+ds[i+1]; Inc(i); end;
   Inc(i); n:= n+Svl(c,b); Inc(b); end; c:=''; k:=''; b:=1; i:=1; d:=false;
   m:=Byte(n[1]); Delete(n,1,1);
   while i<=Length(n)do begin if b<=m*2 then begin if d then begin l:=n[i];
   if (n[i]=zn1) or (n[i]=zn2) then begin l:= n[i]+n[i+1]; Inc(i); end;
   c:=c+l; Inc(b);d:=false; end else begin k:=k+n[i]; d:=true; Inc(b); end;
   end else begin l:= n[i]; if (n[i]=zn1) or (n[i]=zn2) then begin
   l:= n[i]+n[i+1]; Inc(i); end;  c:=c+l; end; Inc(i); end;
   if length(c)=0 then Exit;i:=1;b:=1; while i<=Length(c)do begin l:=c[i];
   if (c[i]=zn1) or (c[i]=zn2) then begin l:=c[i]+c[i+1]; Inc(i); end;
   Inc(i);Result:=Result+Svl(l,Byte(k[b]));Inc(b);if b>Length(k)then b:=1;
   end;
  end;

 end.
