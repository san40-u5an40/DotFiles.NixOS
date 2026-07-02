{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      extensions = with pkgs.vscode-extensions; [
        ms-dotnettools.vscode-dotnet-runtime
        ms-dotnettools.csdevkit
        ms-dotnettools.csharp
        ms-dotnettools.vscodeintellicode-csharp
        redhat.vscode-xml
        ms-ceintl.vscode-language-pack-ru
        shd101wyy.markdown-preview-enhanced
        esbenp.prettier-vscode
      ];
      userSettings = {
        "workbench.colorTheme" = "Red";

        "editor.formatOnSave" = true;
        "editor.formatOnPaste" = false;
        "editor.formatOnType" = false;
        "editor.rulers" = [ 120 ];
        "editor.tabSize" = 4;
        "editor.insertSpaces" = true;

        "[csharp]" = {
          "editor.formatOnSave" = true;
          "editor.defaultFormatter" = "ms-dotnettools.csharp";
          "editor.codeActionsOnSave" = {
            "source.organizeUsings" = "explicit";
            "source.fixAll" = "explicit";
          };
          "editor.tabSize" = 4;
        };
        "[html]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[css]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[xml]" = {
          "editor.formatOnSave" = true;
          "editor.defaultFormatter" = "redhat.vscode-xml";
        };

        "files.exclude" = {
          "/bin" = true;
          "/obj" = true;
          "/.vs" = true;
          "/Debug" = true;
          "/Release" = true;
        };

        "files.watcherExclude" = {
          "/bin/" = true;
          "/obj/" = true;
        };

        "search.exclude" = {
          "/bin" = true;
          "**/obj" = true;
        };

        "telemetry.telemetryLevel" = "off";
        "dotnetAcquisitionExtension.enableTelemetry" = false;
        "terminal.integrated.defaultProfile.linux" = "bash";

        "dotnet.backgroundAnalysis.analyzerDiagnosticsScope" = "openFiles";
        "dotnet.backgroundAnalysis.compilerDiagnosticsScope" = "openFiles";
        "dotnet.codeLens.enableReferencesCodeLens" = true;
        "dotnet.codeLens.enableTestsCodeLens" = true;
        "dotnet.preferCSharpExtension" = true;

        "csharp.format.enable" = true;
        "csharp.semanticHighlighting.enabled" = true;
      };
      keybindings = [
        {
          command = "prettier.forceFormatDocument";
          key = "ctrl+k ctrl+shift+p";
        }
      ];
    };
  };
}
