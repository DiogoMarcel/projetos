unit lib.conexao.db.interfaces;

interface

uses
  Firebase.Interfaces;

type
  IConexaoAbstract = interface
    ['{D7CF41A5-8DAA-437D-93A3-EBC4CD85AD9F}']
    function StartConexao: IConexaoAbstract;
//    function UpdateCadastro: IConexaoAbstract;
  end;

type
  IFactoryConexaoInterface = interface
    ['{841FB46B-E4CB-4E97-A1CF-CB72BD8B6F79}']
    function ObterInstanciaConexao: IConexaoAbstract;
  end;

type
  ILibConfigConexaoDB = interface
    ['{960E8BBA-7D4A-4E0A-AF65-A9B28653903A}']
    function LoadFileConfig: ILibConfigConexaoDB;

    function Server(_ALocalHost: string): string; overload;
    function DataBase(_ADataBase: string): string; overload;
    function UserName(_AUserName: string): string; overload;
    function Password(_APassword: string): string; overload;
    function Port(_APort: string): string; overload;
    function DriverID(_ADriverID: string): string; overload;

    function Server: string; overload;
    function DataBase: string; overload;
    function UserName: string; overload;
    function Password: string; overload;
    function Port: string; overload;
    function DriverID: string; overload;
  end;

type
  ILibLoadConfiguracao = interface
    ['{04005370-BDDF-4028-825D-DD5DF3A0B392}']
    procedure BaseURI(const _BaseURI: string); overload;
    procedure SetApiKey(const _SetApiKey: string); overload;
    procedure Email(const _Email: string); overload;
    procedure Password(const _Password: string); overload;

    function BaseURI: string; overload;
    function SetApiKey: string; overload;
    function Email: string; overload;
    function Password: string; overload;

    function LoadFileConfig: ILibLoadConfiguracao;
  end;

type
  ILibLoginRealtimeDB = interface
    ['{764CCC1E-DDF6-4EA4-AE22-6A0EB076CE37}']
    procedure LoginOnLine;
    procedure AbrirConexao;

    function Conexao: IFirebaseDatabase;
  end;


implementation

end.
