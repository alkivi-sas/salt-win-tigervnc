include:
  - .regedit
  
test-running-service-copy:
  file.managed:
    - name: c:\alkivi\packages\tigervnc\test_running.ps1
    - source: salt://tigervnc/templates/test_running.ps1
    - makedirs: True

restart-service-tigervnc:
  cmd.run:
    - name: Restart-Service -Name TigerVNC
    - shell: powershell
    - require: 
      - reg: password-registry
      - reg: localhost-registry
      - reg: portnumber-registry

##    - unless: powershell -noprofile -executionpolicy bypass -command c:\alkivi\packages\tigervnc\test_running.ps1
