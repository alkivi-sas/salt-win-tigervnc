include:
  - .regedit

test-stoped-service-copy:
  file.managed:
    - name: c:\alkivi\packages\tigervnc\test_stopped.ps1
    - source: salt://tigervnc/templates/test_stopped.ps1
    - makedirs: True

service-tigervnc:
  cmd.run:
    - name: Start-Service -Name TigerVNC
    - shell: powershell
    - unless: powershell -noprofile -executionpolicy bypass -command c:\alkivi\packages\tigervnc\test_stopped.ps1
    - require: 
      - reg: password-registry
      - reg: localhost-registry
      - reg: portnumber-registry

