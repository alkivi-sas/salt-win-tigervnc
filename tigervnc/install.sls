{% from "tigervnc/map.jinja" import tigervnc with context -%}

tigervnc-present-test-copy:
  file.managed:
    - name: c:\alkivi\packages\tigervnc\test_tigervnc.ps1
    - source: salt://tigervnc/templates/test_tigervnc.ps1
    - makedirs: True

tigervnc-download:
  file.managed:
    - name: c:\alkivi\packages\tigervnc\{{ tigervnc.installer }}
    - source: {{ tigervnc.url }}
    - source_hash: sha256={{ tigervnc.hash }}
    - makedirs: True
    - unless: powershell -noprofile -executionpolicy bypass -command c:\alkivi\packages\tigervnc\test_tigervnc.ps1

tigervnc-install:
  cmd.run:
    - name: .\{{ tigervnc.installer }} /verysilent
    - cwd: c:\alkivi\packages\tigervnc\
    - shell: powershell
    - unless: powershell -noprofile -executionpolicy bypass -command c:\alkivi\packages\tigervnc\test_tigervnc.ps1
    - require:
      - file: c:\alkivi\packages\tigervnc\{{ tigervnc.installer }}

