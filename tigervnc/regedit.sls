{% from "tigervnc/map.jinja" import tigervnc with context %}

password-registry:
  reg.present:
    - name: HKLM\SOFTWARE\TigerVNC\WinVNC4
    - vname: Password
    - vdata: !!binary {{ salt['vnc.hash_password'](tigervnc.password, True) }}
    - vtype: REG_BINARY

localhost-registry:
  reg.present:
    - name: HKLM\SOFTWARE\TigerVNC\WinVNC4
    - vname: LocalHost
    - vdata: 1
    - vtype: REG_DWORD

portnumber-registry:
  reg.present:
    - name: HKLM\SOFTWARE\TigerVNC\WinVNC4
    - vname: PortNumber
    - vdata: 5900
    - vtype: REG_DWORD
