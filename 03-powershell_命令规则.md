1. powershell �������

�ɶ̻��� (-) �ָ��Ķ��ʺ�����

���� Get-Help��Get-Process �� Start-Service

�ܹ������ද��

get cmdlet ����������

set cmdlet ���������������

format cmdlet ���������ݸ�ʽ

out cmdlet �����������ָ����Ŀ��

2. �鿴ĳ������ľ������


get-help <cmdlet-name> -detailed

cmdlet �����ļ�����ϸ��ͼ���� cmdlet ˵���������﷨������˵������ʾ cmdlet �÷���ʾ��

3. �鿴ĳ����������ж���

get-service | get-member 

4. powershell �ű���׺

powerscp.ps1

Windows PowerShell ������һ�ַǳ��ḻ�Ľű����ԣ�ʹ�ø����Կ��Դ�������򵥵��ǳ����ӵĽű���

��֧������ѭ���������������ƺͱ�����ֵ�����Խṹ��

5. get-help ��ز���

get-help get-command

get-help about_execution_policies

get-help get-command -detailed

get-help get-command -full

get-help get-command -examples

get-help get-command -parameter totalcount

get-help get-command -parameter *

get-help get-process -online

man get-command

help get-command


get-help get-*


get-help about_wildcards


get-help about_*


6. ����

get-date

get-command

get-command -name *.exe

��ȡ�й� Server01 Զ�̼������ BIOS ����Ϣ

get-wmiobject win32_bios -computername server01

�����Ҫ�κ� cmdlet �İ���������룺

get-help <cmdlet-name> -detailed

get-help get-alias -detailed


7. ����

���һỰ�е����к���

get-command -CommandType function


������ʽ��

function <name> { <commands> }

���磺

function GMEX {get-help get-member -examples}

8. ģ��

ģ���ǰ��������� Windows PowerShell ��ʹ�õ������������ĳ������

����ģ��

import-module <module-name>

import-module c:\ps-test\TestCmdlets


9. ����

Get-Member �������õ� cmdlet ֮һ������ʾ�й�����ص� .NET Framework �������Ϣ������Ϣ������������͡����Ժͷ�����


get-service | get-member

��Ҫ�г��ض���������Ե�ֵ������룺

(get-service <service-name>).<property-name>

(get-service alerter).canpauseandcontinue

��Ҫ��ʾ Alerter ����� CanPauseAndContinue ���Ե����ƺ�ֵ���б�����룺

get-service alerter | format-list -property name, CanPauseAndContinue

��Ҫ��ʾ Alerter �������������ֵ���б�����룺

get-service alerter | format-list -property *

��Ҫ��ʾ���з���� CanPauseAndContinue ���Ե����ƺ�ֵ�ı�����룺

get-service | format-table -property name, CanPauseAndContinue

10.���������ʽ











