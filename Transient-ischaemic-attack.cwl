cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  transient-ischaemic-attack-tia---primary:
    run: transient-ischaemic-attack-tia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  transient-ischaemic-attack-fugax---primary:
    run: transient-ischaemic-attack-fugax---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: transient-ischaemic-attack-tia---primary/output
  transient-ischaemic-attack-amnesia---primary:
    run: transient-ischaemic-attack-amnesia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: transient-ischaemic-attack-fugax---primary/output
  transient-ischaemic-attack-ischaemia---primary:
    run: transient-ischaemic-attack-ischaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: transient-ischaemic-attack-amnesia---primary/output
  other-transient-ischaemic-attack---primary:
    run: other-transient-ischaemic-attack---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: transient-ischaemic-attack-ischaemia---primary/output
  vertebrobasilar-transient-ischaemic-attack---primary:
    run: vertebrobasilar-transient-ischaemic-attack---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: other-transient-ischaemic-attack---primary/output
  transient-ischaemic-attack-history---primary:
    run: transient-ischaemic-attack-history---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: vertebrobasilar-transient-ischaemic-attack---primary/output
  transient-ischaemic-attack-artery---secondary:
    run: transient-ischaemic-attack-artery---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: transient-ischaemic-attack-history---primary/output
  transient-ischaemic-attack-syndrome---secondary:
    run: transient-ischaemic-attack-syndrome---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: transient-ischaemic-attack-artery---secondary/output
  transient-ischaemic-attack---secondary:
    run: transient-ischaemic-attack---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: transient-ischaemic-attack-syndrome---secondary/output
  precerebral-transient-ischaemic-attack---secondary:
    run: precerebral-transient-ischaemic-attack---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: transient-ischaemic-attack---secondary/output
  transient-ischaemic-attack-infarction---secondary:
    run: transient-ischaemic-attack-infarction---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: precerebral-transient-ischaemic-attack---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: transient-ischaemic-attack-infarction---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
