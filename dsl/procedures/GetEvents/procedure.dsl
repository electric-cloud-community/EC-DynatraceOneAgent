// This procedure.dsl was generated automatically
// === procedure_autogen starts ===
procedure 'GetEvents', description: 'Return a list of events', {

    step 'GetEvents', {
        description = ''
        command = new File(pluginDir, "dsl/procedures/GetEvents/steps/GetEvents.pl").text
        shell = 'ec-perl'

    }

    formalOutputParameter 'events',
        description: 'the json representation of the events'
// === procedure_autogen ends, checksum: d965b71a1f9b1a1f36aef3ca4048a531 ===
// Do not update the code above the line
// procedure properties declaration can be placed in here, like
// property 'property name', value: "value"
}