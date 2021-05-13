# ConstraintLearning-2021
ConstraintLearning-2021 Paper: Data and Processes.  

## Quickstart Guide 
Install python 3.x.

Install the following libraries:

```bash
$ pip install problog
$ pip install probfoil
$ pip install regex
$ pip install pandas
$ pip install owlready2
```

Take any OntoUML model generated through [Visual Paradigm](https://www.visual-paradigm.com/), install the [onto-vp-plugin](https://github.com/OntoUML/ontouml-vp-plugin) to convert the model into `.ttl` (or `.rdf`, `.owl`) format (see [related model](https://github.com/OntoUML/ConstraintLearning-SoSyM2021/tree/main/model) examples).

Run the the [gufo2alloy](https://github.com/OntoUML/gufo2alloy) converter to generate Alloy `.als` specifications (see [related model](https://github.com/OntoUML/ConstraintLearning-SoSyM2021/tree/main/model) examples). 

Customize the simulations scope. Run simulations. Save the output simulations into `.txt` files.

Use the input model (`.rdf` format) and the generated `.txt` [simulations](https://github.com/OntoUML/ConstraintLearning-SoSyM2021/tree/main/simulations) as inputs of the [probfoil converter](https://github.com/OntoUML/ConstraintLearning-SoSyM2021/tree/main/converter).

Generate .data and .settings probfoil input files with the corresponding .py files:

```bash
python file.py > output.txt
```

Play with the generated [probfoil data](https://github.com/OntoUML/ConstraintLearning-SoSyM2021/tree/main/probfoil-data) and elicit neg/pos. For the probfoil set-up see related [guidelines](https://pypi.org/project/probfoil/).

As an example see the [output rules](https://github.com/OntoUML/ConstraintLearning-SoSyM2021/tree/main/learned-rules) described in the paper.

