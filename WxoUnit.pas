unit WxoUnit;
{
说明：
本单元为提供用户的单元，一般仅提供相应版本的dcu,所有WXO是一样的

}

interface

uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, SHDocVw,MSHTML;
var
     giCtrl    : THandle;
     giApp     : THandle;
     giIE      : THandle;
     gsUrl     : PChar;

procedure WWShowForm(oForm:TForm);

procedure CloseIE;
procedure CloseIEDirect;
procedure SetIEFullScreen(bVal : Boolean);
function  GetIEFullScreen:Boolean;
procedure SetIEMenuBar(bVal : Boolean);
function  GetIEMenuBar : Boolean;
procedure SetIEStatusBar(bVal : Boolean);
function  GetIEStatusBar : Boolean;
procedure SetIEStatusText(Text : PAnsiChar);
procedure SetIEToolBar(iVal : Integer);
function  GetIEToolBar : Integer;
procedure SetIEResizable(bVal : Boolean);
function  GetIEResizable : Boolean;
procedure SetIEMax;
procedure SetIEMin;
procedure SetIEPos(Left,Top,Width,Height:Integer);
procedure GetIEPos(var Left:Integer;var Top:Integer;var Width:Integer;var Height:Integer);
procedure GotoIEUrl(sUrl:PChar;bNew:Boolean);
procedure SetIECaption(sCaption:PWideChar);
function  GetWebBrowser:IWebBrowser2;
function  GetHTMLWindow2: IHTMLWindow2;
procedure GetAttachFile(URL:PChar;ID:Integer);

implementation


procedure WWShowForm(oForm:TForm);
begin
     oForm.BorderStyle   := bsNone;
     //
     oForm.Update;
     oForm.Show;
end;

procedure CloseIEDirect;
type
     TApp = procedure ;cdecl;
var
     oApp : TApp;
begin
     if giCtrl>32 then begin
          @oApp     := GetProcAddress(giCtrl,'CloseIEDirect');
          if @oApp <> nil then begin
               try
                    oApp;
               except
               end;
          end;
     end;
end;

procedure CloseIE;
type
     TApp = procedure ;cdecl;
var
     oApp : TApp;
begin
     if giCtrl>32 then begin
          @oApp     := GetProcAddress(giCtrl,'CloseIE');
          if @oApp <> nil then begin
               try
                    oApp;
               except
               end;
          end;
     end;
end;

procedure SetIEResizable(bVal : Boolean);
type
     TApp = procedure (bVal:Boolean);cdecl;
var
     oSFS : TApp;
begin
     if giCtrl>32 then begin
          @oSFS     := GetProcAddress(giCtrl,'SetIEResizable');
          if @oSFS <> nil then begin
               try
                    oSFS(bVal);
               except
               end;
          end;
     end;
end;

function GetIEResizable : Boolean;
type
     TApp = function():Boolean;cdecl;
var
     oGFS : TApp;
begin
     if giCtrl>32 then begin
          @oGFS     := GetProcAddress(giCtrl,'GetIEResizable');
          if @oGFS <> nil then begin
               try
                    Result    := oGFS();
               except
               end;
          end;
     end;
end;

procedure SetIEFullScreen(bVal : Boolean);
type
     TSetFullScreen = procedure (bVal:Boolean);cdecl;
var
     oSFS : TSetFullScreen;
begin
     if giCtrl>32 then begin
          @oSFS     := GetProcAddress(giCtrl,'SetIEFullScreen');
          if @oSFS <> nil then begin
               try
                    oSFS(bVal);
               except
               end;
          end;
     end;
end;

function GetIEFullScreen : Boolean;
type
     TGetFullScreen = function():Boolean;cdecl;
var
     oGFS : TGetFullScreen;
begin
     if giCtrl>32 then begin
          @oGFS     := GetProcAddress(giCtrl,'GetIEFullScreen');
          if @oGFS <> nil then begin
               try
                    Result    := oGFS();
               except
               end;
          end;
     end;
end;

procedure SetIEMenuBar(bVal : Boolean);
type
     TSetMenuBar = procedure (bVal:Boolean);cdecl;
var
     oSFS : TSetMenuBar;
begin
     if giCtrl>32 then begin
          @oSFS     := GetProcAddress(giCtrl,'SetIEMenuBar');
          if @oSFS <> nil then begin
               try
                    oSFS(bVal);
               except
               end;
          end;
     end;
end;

function GetIEMenuBar : Boolean;
type
     TGetMenuBar = function():Boolean;cdecl;
var
     oGFS : TGetMenuBar;
begin
     if giCtrl>32 then begin
          @oGFS     := GetProcAddress(giCtrl,'GetIEMenuBar');
          if @oGFS <> nil then begin
               try
                    Result    := oGFS();
               except
               end;
          end;
     end;
end;

procedure SetIEStatusBar(bVal : Boolean);
type
     TApp = procedure (bVal:Boolean);cdecl;
var
     oSFS : TApp;
begin
     if giCtrl>32 then begin
          @oSFS     := GetProcAddress(giCtrl,'SetIEStatusBar');
          if @oSFS <> nil then begin
               try
                    oSFS(bVal);
               except
               end;
          end;
     end;
end;

function GetIEStatusBar : Boolean;
type
     TApp = function():Boolean;cdecl;
var
     oGFS : TApp;
begin
     if giCtrl>32 then begin
          @oGFS     := GetProcAddress(giCtrl,'GetIEStatusBar');
          if @oGFS <> nil then begin
               try
                    Result    := oGFS();
               except
               end;
          end;
     end;
end;

procedure SetIEStatusText(Text : PAnsiChar);
type
     TApp = procedure (Text : PAnsichar);cdecl;
var
     oSFS : TApp;
begin
     if giCtrl>32 then begin
          @oSFS     := GetProcAddress(giCtrl,'SetIEStatusText');
          if @oSFS <> nil then begin
               try
                    oSFS(Text);
               except
               end;
          end;
     end;
end;

function GetIEStatusText : PAnsiChar;
type
     TApp = function():PAnsiChar;cdecl;
var
     oGFS : TApp;
begin
     if giCtrl>32 then begin
          @oGFS     := GetProcAddress(giCtrl,'GetIEStatusText');
          if @oGFS <> nil then begin
               try
                    Result    := oGFS();
               except
               end;
          end;
     end;
end;

procedure SetIEPos(Left,Top,Width,Height : Integer);
type
     TApp = procedure (Left,Top,Width,Height : Integer);cdecl;
var
     oSFS : TApp;
begin
     if giCtrl>32 then begin
          @oSFS     := GetProcAddress(giCtrl,'SetIEPos');
          if @oSFS <> nil then begin
               try
                    oSFS(Left,Top,Width,Height);
               except
               end;
          end;
     end;
end;

procedure GetIEPos(var Left:Integer;var Top:Integer;var Width:Integer;var Height:Integer);
type
     TApp = procedure (var Left:Integer;var Top:Integer;var Width:Integer;var Height:Integer);cdecl;
var
     oSFS : TApp;
begin
     if giCtrl>32 then begin
          @oSFS     := GetProcAddress(giCtrl,'GetIEPos');
          if @oSFS <> nil then begin
               try
                    oSFS(Left,Top,Width,Height);
               except
               end;
          end;
     end;
end;



procedure SetIEToolBar(iVal : Integer);
type
     TSetToolBar = procedure (iVal:Integer);cdecl;
var
     oSFS : TSetToolBar;
begin
     if giCtrl>32 then begin
          @oSFS     := GetProcAddress(giCtrl,'SetIEToolBar');
          if @oSFS <> nil then begin
               try
                    oSFS(iVal);
               except
               end;
          end;
     end;
end;

function GetIEToolBar : Integer;
type
     TGetToolBar = function():Integer;cdecl;
var
     oGFS : TGetToolBar;
begin
     if giCtrl>32 then begin
          @oGFS     := GetProcAddress(giCtrl,'GetIEToolBar');
          if @oGFS <> nil then begin
               try
                    Result    := oGFS();
               except
               end;
          end;
     end;
end;

procedure SetIEMax;
type
     TApp = procedure ;cdecl;
var
     oApp : TApp;
begin
     if giCtrl>32 then begin
          @oApp     := GetProcAddress(giCtrl,'SetIEMax');
          if @oApp <> nil then begin
               try
                    oApp;
               except
               end;
          end;
     end;
end;

procedure SetIEMin;
type
     TApp = procedure ;cdecl;
var
     oApp : TApp;
begin
     if giCtrl>32 then begin
          @oApp     := GetProcAddress(giCtrl,'SetIEMin');
          if @oApp <> nil then begin
               try
                    oApp;
               except
               end;
          end;
     end;
end;

procedure GotoIEUrl(sUrl:PChar;bNew:Boolean);
type
     TApp = procedure (sUrl:PChar;bNew:Boolean);cdecl;
var
     oSFS : TApp;
begin
     if giCtrl>32 then begin
          @oSFS     := GetProcAddress(giCtrl,'GotoIEUrl');
          if @oSFS <> nil then begin
               try
                    //ShowMessage('IECtrl  '+sUrl);
                    oSFS(sUrl,bNew);
               except
               end;
          end;
     end;
end;

procedure SetIECaption(sCaption:PWideChar);
begin
     SendMessage(giIE,$000C,0,integer(sCaption));
end;


function  GetWXOUrl:Pchar;
type
     TApp = function():Pchar;cdecl;
var
     oGFS : TApp;
begin
     if giCtrl>32 then begin
          @oGFS     := GetProcAddress(giCtrl,'GetWXOUrl');
          if @oGFS <> nil then begin
               try
                    Result    := oGFS();
               except
               end;
          end;
     end;
end;

function  GetWebBrowser:IWebBrowser2;
type
     TApp = function():IWebBrowser2;cdecl;
var
     oGFS : TApp;
begin
     if giCtrl>32 then begin
          @oGFS     := GetProcAddress(giCtrl,'GetWebBrowser');
          if @oGFS <> nil then begin
               try
                    Result    := oGFS();
               except
               end;
          end;
     end;
end;

function  GetHTMLWindow2: IHTMLWindow2;
type
     TApp = function():IHTMLWindow2;cdecl;
var
     oGFS : TApp;
begin
     if giCtrl>32 then begin
          @oGFS     := GetProcAddress(giCtrl,'GetHTMLWindow2');
          if @oGFS <> nil then begin
               try
                    Result    := oGFS();
               except
               end;
          end;
     end;
end;

procedure GetAttachFile(URL:PChar;ID:Integer);
type
     TApp = procedure (Url:PChar;ID:Integer);cdecl;
var
     oSFS : TApp;
begin
     if giCtrl>32 then begin
          @oSFS     := GetProcAddress(giCtrl,'GetAttachFile');
          if @oSFS <> nil then begin
               try
                    oSFS(Url,ID);
               except
               end;
          end;
     end;
end;



end.
