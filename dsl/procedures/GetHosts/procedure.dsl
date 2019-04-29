// This procedure.dsl was generated automatically
// === procedure_autogen starts ===
procedure 'GetHosts', description: 'Return a list of hosts', {

    step 'GetHosts', {
        description = ''
        command = new File(pluginDir, "dsl/procedures/GetHosts/steps/GetHosts.pl").text
        shell = 'ec-perl'

    }

    formalOutputParameter 'hosts',
        description: 'the json representation of the hosts'
// === procedure_autogen ends, checksum: 0cbed1f6c20f770ed8f258cfe42035c2 ===
// Do not update the code above the line
// procedure properties declaration can be placed in here, like
// property 'property name', value: "value"
}