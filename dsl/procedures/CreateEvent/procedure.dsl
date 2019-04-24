// This procedure.dsl was generated automatically
// === procedure_autogen starts ===
procedure 'CreateEvent', description: 'Create an Event', {

    step 'CreateEvent', {
        description = 'Create an event for the host'
        command = new File(pluginDir, "dsl/procedures/CreateEvent/steps/CreateEvent.pl").text
        shell = 'ec-perl'

    }
// === procedure_autogen ends, checksum: 57d29a7a6dc09ef3cefd748820424032 ===
// Do not update the code above the line
// procedure properties declaration can be placed in here, like
// property 'property name', value: "value"
}