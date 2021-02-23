# ConstraintLearning-SoSyM2021
ConstraintLearning-SoSyM2021 Paper: Data and Processes.  

## Installation
Python 3.x needed.

```bash
$ pip install problog
$ pip install probfoil
$ pip install regex
$ pip install owlready2
```

## Quickstart 
Take any OntoUML generated through [Visual Paradigm](https://www.visual-paradigm.com/), install the [onto-vp-plugin](https://github.com/OntoUML/ontouml-vp-plugin) to convert it into `.ttl` (or `.rdf`, `.owl`) format (see [related model](https://github.com/OntoUML/ConstraintLearning-SoSyM2021/tree/main/model)).

Use the the [gufo2alloy](https://github.com/OntoUML/gufo2alloy) converter to generate Alloy `.als` specifications (see [related model](https://github.com/OntoUML/ConstraintLearning-SoSyM2021/tree/main/model)). 

Generate simulations.

Convert the input model (`.rdf` format) and the generated [simulations](https://github.com/OntoUML/ConstraintLearning-SoSyM2021/tree/main/simulations)) through the [probfoil converter](https://github.com/OntoUML/ConstraintLearning-SoSyM2021/tree/main/converter).

Generate .data and .settings files with the corresponding .py files:

```bash
python file.py > output.txt
```

Play with the generated [probfoil data](https://github.com/OntoUML/ConstraintLearning-SoSyM2021/tree/main/probfoil-data) and elicit neg/pos. For the probfoil set-up see related [guidelines](https://pypi.org/project/probfoil/).

As an example see the [output rules](https://github.com/OntoUML/ConstraintLearning-SoSyM2021/tree/main/learned-rules) described in the paper.

