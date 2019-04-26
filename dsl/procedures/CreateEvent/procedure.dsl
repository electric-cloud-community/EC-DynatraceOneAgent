// This procedure.dsl was generated automatically
// === procedure_autogen starts ===
procedure 'CreateEvent', description: 'Create an Event', {

    step 'CreateEvent', {
        description = 'Create an event for the host'
        command = new File(pluginDir, "dsl/procedures/CreateEvent/steps/CreateEvent.pl").text
        shell = 'ec-perl'

    }

    formalOutputParameter 'event',
        description: 'the json representation of the event created'

    formalOutputParameter 'eventId',
        description: 'ID of the event created'
// === procedure_autogen ends, checksum: bd2298fdf6d18d7c83be732348a50041 ===
// Do not update the code above the line
// procedure properties declaration can be placed in here, like
// property 'property name', value: "value"
}