ç 
Û¬
D
AddV2
x"T
y"T
z"T"
Ttype:
2	
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
?
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
[
Split
	split_dim

value"T
output"T*	num_split"
	num_splitint(0"	
Ttype
Á
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ¨
@
StaticRegexFullMatch	
input

output
"
patternstring
ö
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
°
TensorListFromTensor
tensor"element_dtype
element_shape"
shape_type/
output_handleéèelement_dtype"
element_dtypetype"

shape_typetype:
2	

TensorListReserve
element_shape"
shape_type
num_elements(
handleéèelement_dtype"
element_dtypetype"

shape_typetype:
2	

TensorListStack
input_handle
element_shape
tensor"element_dtype"
element_dtypetype" 
num_elementsintÿÿÿÿÿÿÿÿÿ
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 

While

input2T
output2T"
T
list(type)("
condfunc"
bodyfunc" 
output_shapeslist(shape)
 "
parallel_iterationsint
"serve*2.8.02v2.8.0-rc1-32-g3f878cff5b68Ó
u
dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*
shared_namedense/kernel
n
 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
_output_shapes
:	*
dtype0
l

dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_name
dense/bias
e
dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes
:*
dtype0
j
Adamax/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_nameAdamax/iter
c
Adamax/iter/Read/ReadVariableOpReadVariableOpAdamax/iter*
_output_shapes
: *
dtype0	
n
Adamax/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdamax/beta_1
g
!Adamax/beta_1/Read/ReadVariableOpReadVariableOpAdamax/beta_1*
_output_shapes
: *
dtype0
n
Adamax/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdamax/beta_2
g
!Adamax/beta_2/Read/ReadVariableOpReadVariableOpAdamax/beta_2*
_output_shapes
: *
dtype0
l
Adamax/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdamax/decay
e
 Adamax/decay/Read/ReadVariableOpReadVariableOpAdamax/decay*
_output_shapes
: *
dtype0
|
Adamax/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdamax/learning_rate
u
(Adamax/learning_rate/Read/ReadVariableOpReadVariableOpAdamax/learning_rate*
_output_shapes
: *
dtype0

lstm/lstm_cell/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	Ø*&
shared_namelstm/lstm_cell/kernel

)lstm/lstm_cell/kernel/Read/ReadVariableOpReadVariableOplstm/lstm_cell/kernel*
_output_shapes
:	Ø*
dtype0

lstm/lstm_cell/recurrent_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
Ø*0
shared_name!lstm/lstm_cell/recurrent_kernel

3lstm/lstm_cell/recurrent_kernel/Read/ReadVariableOpReadVariableOplstm/lstm_cell/recurrent_kernel* 
_output_shapes
:
Ø*
dtype0

lstm/lstm_cell/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:Ø*$
shared_namelstm/lstm_cell/bias
x
'lstm/lstm_cell/bias/Read/ReadVariableOpReadVariableOplstm/lstm_cell/bias*
_output_shapes	
:Ø*
dtype0

lstm_1/lstm_cell_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
**
shared_namelstm_1/lstm_cell_1/kernel

-lstm_1/lstm_cell_1/kernel/Read/ReadVariableOpReadVariableOplstm_1/lstm_cell_1/kernel* 
_output_shapes
:
*
dtype0
¤
#lstm_1/lstm_cell_1/recurrent_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*4
shared_name%#lstm_1/lstm_cell_1/recurrent_kernel

7lstm_1/lstm_cell_1/recurrent_kernel/Read/ReadVariableOpReadVariableOp#lstm_1/lstm_cell_1/recurrent_kernel* 
_output_shapes
:
*
dtype0

lstm_1/lstm_cell_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_namelstm_1/lstm_cell_1/bias

+lstm_1/lstm_cell_1/bias/Read/ReadVariableOpReadVariableOplstm_1/lstm_cell_1/bias*
_output_shapes	
:*
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0

Adamax/dense/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*&
shared_nameAdamax/dense/kernel/m

)Adamax/dense/kernel/m/Read/ReadVariableOpReadVariableOpAdamax/dense/kernel/m*
_output_shapes
:	*
dtype0
~
Adamax/dense/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdamax/dense/bias/m
w
'Adamax/dense/bias/m/Read/ReadVariableOpReadVariableOpAdamax/dense/bias/m*
_output_shapes
:*
dtype0

Adamax/lstm/lstm_cell/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	Ø*/
shared_name Adamax/lstm/lstm_cell/kernel/m

2Adamax/lstm/lstm_cell/kernel/m/Read/ReadVariableOpReadVariableOpAdamax/lstm/lstm_cell/kernel/m*
_output_shapes
:	Ø*
dtype0
®
(Adamax/lstm/lstm_cell/recurrent_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
Ø*9
shared_name*(Adamax/lstm/lstm_cell/recurrent_kernel/m
§
<Adamax/lstm/lstm_cell/recurrent_kernel/m/Read/ReadVariableOpReadVariableOp(Adamax/lstm/lstm_cell/recurrent_kernel/m* 
_output_shapes
:
Ø*
dtype0

Adamax/lstm/lstm_cell/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:Ø*-
shared_nameAdamax/lstm/lstm_cell/bias/m

0Adamax/lstm/lstm_cell/bias/m/Read/ReadVariableOpReadVariableOpAdamax/lstm/lstm_cell/bias/m*
_output_shapes	
:Ø*
dtype0
¢
"Adamax/lstm_1/lstm_cell_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*3
shared_name$"Adamax/lstm_1/lstm_cell_1/kernel/m

6Adamax/lstm_1/lstm_cell_1/kernel/m/Read/ReadVariableOpReadVariableOp"Adamax/lstm_1/lstm_cell_1/kernel/m* 
_output_shapes
:
*
dtype0
¶
,Adamax/lstm_1/lstm_cell_1/recurrent_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*=
shared_name.,Adamax/lstm_1/lstm_cell_1/recurrent_kernel/m
¯
@Adamax/lstm_1/lstm_cell_1/recurrent_kernel/m/Read/ReadVariableOpReadVariableOp,Adamax/lstm_1/lstm_cell_1/recurrent_kernel/m* 
_output_shapes
:
*
dtype0

 Adamax/lstm_1/lstm_cell_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*1
shared_name" Adamax/lstm_1/lstm_cell_1/bias/m

4Adamax/lstm_1/lstm_cell_1/bias/m/Read/ReadVariableOpReadVariableOp Adamax/lstm_1/lstm_cell_1/bias/m*
_output_shapes	
:*
dtype0

Adamax/dense/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*&
shared_nameAdamax/dense/kernel/v

)Adamax/dense/kernel/v/Read/ReadVariableOpReadVariableOpAdamax/dense/kernel/v*
_output_shapes
:	*
dtype0
~
Adamax/dense/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdamax/dense/bias/v
w
'Adamax/dense/bias/v/Read/ReadVariableOpReadVariableOpAdamax/dense/bias/v*
_output_shapes
:*
dtype0

Adamax/lstm/lstm_cell/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	Ø*/
shared_name Adamax/lstm/lstm_cell/kernel/v

2Adamax/lstm/lstm_cell/kernel/v/Read/ReadVariableOpReadVariableOpAdamax/lstm/lstm_cell/kernel/v*
_output_shapes
:	Ø*
dtype0
®
(Adamax/lstm/lstm_cell/recurrent_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
Ø*9
shared_name*(Adamax/lstm/lstm_cell/recurrent_kernel/v
§
<Adamax/lstm/lstm_cell/recurrent_kernel/v/Read/ReadVariableOpReadVariableOp(Adamax/lstm/lstm_cell/recurrent_kernel/v* 
_output_shapes
:
Ø*
dtype0

Adamax/lstm/lstm_cell/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:Ø*-
shared_nameAdamax/lstm/lstm_cell/bias/v

0Adamax/lstm/lstm_cell/bias/v/Read/ReadVariableOpReadVariableOpAdamax/lstm/lstm_cell/bias/v*
_output_shapes	
:Ø*
dtype0
¢
"Adamax/lstm_1/lstm_cell_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*3
shared_name$"Adamax/lstm_1/lstm_cell_1/kernel/v

6Adamax/lstm_1/lstm_cell_1/kernel/v/Read/ReadVariableOpReadVariableOp"Adamax/lstm_1/lstm_cell_1/kernel/v* 
_output_shapes
:
*
dtype0
¶
,Adamax/lstm_1/lstm_cell_1/recurrent_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*=
shared_name.,Adamax/lstm_1/lstm_cell_1/recurrent_kernel/v
¯
@Adamax/lstm_1/lstm_cell_1/recurrent_kernel/v/Read/ReadVariableOpReadVariableOp,Adamax/lstm_1/lstm_cell_1/recurrent_kernel/v* 
_output_shapes
:
*
dtype0

 Adamax/lstm_1/lstm_cell_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*1
shared_name" Adamax/lstm_1/lstm_cell_1/bias/v

4Adamax/lstm_1/lstm_cell_1/bias/v/Read/ReadVariableOpReadVariableOp Adamax/lstm_1/lstm_cell_1/bias/v*
_output_shapes	
:*
dtype0

NoOpNoOp
?
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*È>
value¾>B»> B´>
Î
layer_with_weights-0
layer-0
layer-1
layer_with_weights-1
layer-2
layer_with_weights-2
layer-3
	optimizer
	variables
trainable_variables
regularization_losses
		keras_api

__call__
*&call_and_return_all_conditional_losses
_default_save_signature

signatures*
Á
cell

state_spec
	variables
trainable_variables
regularization_losses
	keras_api
_random_generator
__call__
*&call_and_return_all_conditional_losses*
¥
	variables
trainable_variables
regularization_losses
	keras_api
_random_generator
__call__
*&call_and_return_all_conditional_losses* 
Á
cell

state_spec
 	variables
!trainable_variables
"regularization_losses
#	keras_api
$_random_generator
%__call__
*&&call_and_return_all_conditional_losses*
¦

'kernel
(bias
)	variables
*trainable_variables
+regularization_losses
,	keras_api
-__call__
*.&call_and_return_all_conditional_losses*
Ù
/iter

0beta_1

1beta_2
	2decay
3learning_rate'mu(mv4mw5mx6my7mz8m{9m|'v}(v~4v5v6v7v8v9v*
<
40
51
62
73
84
95
'6
(7*
<
40
51
62
73
84
95
'6
(7*
* 
°
:non_trainable_variables

;layers
<metrics
=layer_regularization_losses
>layer_metrics
	variables
trainable_variables
regularization_losses

__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
* 
* 
* 

?serving_default* 
ã
@
state_size

4kernel
5recurrent_kernel
6bias
A	variables
Btrainable_variables
Cregularization_losses
D	keras_api
E_random_generator
F__call__
*G&call_and_return_all_conditional_losses*
* 

40
51
62*

40
51
62*
* 


Hstates
Inon_trainable_variables

Jlayers
Kmetrics
Llayer_regularization_losses
Mlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
* 

Nnon_trainable_variables

Olayers
Pmetrics
Qlayer_regularization_losses
Rlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses* 
* 
* 
* 
ã
S
state_size

7kernel
8recurrent_kernel
9bias
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X_random_generator
Y__call__
*Z&call_and_return_all_conditional_losses*
* 

70
81
92*

70
81
92*
* 


[states
\non_trainable_variables

]layers
^metrics
_layer_regularization_losses
`layer_metrics
 	variables
!trainable_variables
"regularization_losses
%__call__
*&&call_and_return_all_conditional_losses
&&"call_and_return_conditional_losses*
* 
* 
* 
\V
VARIABLE_VALUEdense/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
XR
VARIABLE_VALUE
dense/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*

'0
(1*

'0
(1*
* 

anon_trainable_variables

blayers
cmetrics
dlayer_regularization_losses
elayer_metrics
)	variables
*trainable_variables
+regularization_losses
-__call__
*.&call_and_return_all_conditional_losses
&."call_and_return_conditional_losses*
* 
* 
NH
VARIABLE_VALUEAdamax/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE*
RL
VARIABLE_VALUEAdamax/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE*
RL
VARIABLE_VALUEAdamax/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdamax/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEAdamax/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUElstm/lstm_cell/kernel&variables/0/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUElstm/lstm_cell/recurrent_kernel&variables/1/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUElstm/lstm_cell/bias&variables/2/.ATTRIBUTES/VARIABLE_VALUE*
YS
VARIABLE_VALUElstm_1/lstm_cell_1/kernel&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUE#lstm_1/lstm_cell_1/recurrent_kernel&variables/4/.ATTRIBUTES/VARIABLE_VALUE*
WQ
VARIABLE_VALUElstm_1/lstm_cell_1/bias&variables/5/.ATTRIBUTES/VARIABLE_VALUE*
* 
 
0
1
2
3*

f0*
* 
* 
* 
* 

40
51
62*

40
51
62*
* 

gnon_trainable_variables

hlayers
imetrics
jlayer_regularization_losses
klayer_metrics
A	variables
Btrainable_variables
Cregularization_losses
F__call__
*G&call_and_return_all_conditional_losses
&G"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

0*
* 
* 
* 
* 
* 
* 
* 
* 
* 

70
81
92*

70
81
92*
* 

lnon_trainable_variables

mlayers
nmetrics
olayer_regularization_losses
player_metrics
T	variables
Utrainable_variables
Vregularization_losses
Y__call__
*Z&call_and_return_all_conditional_losses
&Z"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

0*
* 
* 
* 
* 
* 
* 
* 
* 
8
	qtotal
	rcount
s	variables
t	keras_api*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
SM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

q0
r1*

s	variables*
{
VARIABLE_VALUEAdamax/dense/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdamax/dense/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUEAdamax/lstm/lstm_cell/kernel/mBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE(Adamax/lstm/lstm_cell/recurrent_kernel/mBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
xr
VARIABLE_VALUEAdamax/lstm/lstm_cell/bias/mBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUE"Adamax/lstm_1/lstm_cell_1/kernel/mBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE,Adamax/lstm_1/lstm_cell_1/recurrent_kernel/mBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUE Adamax/lstm_1/lstm_cell_1/bias/mBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
{
VARIABLE_VALUEAdamax/dense/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdamax/dense/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUEAdamax/lstm/lstm_cell/kernel/vBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUE(Adamax/lstm/lstm_cell/recurrent_kernel/vBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
xr
VARIABLE_VALUEAdamax/lstm/lstm_cell/bias/vBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUE"Adamax/lstm_1/lstm_cell_1/kernel/vBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE,Adamax/lstm_1/lstm_cell_1/recurrent_kernel/vBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUE Adamax/lstm_1/lstm_cell_1/bias/vBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

serving_default_lstm_inputPlaceholder*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0* 
shape:ÿÿÿÿÿÿÿÿÿ

StatefulPartitionedCallStatefulPartitionedCallserving_default_lstm_inputlstm/lstm_cell/kernellstm/lstm_cell/recurrent_kernellstm/lstm_cell/biaslstm_1/lstm_cell_1/kernel#lstm_1/lstm_cell_1/recurrent_kernellstm_1/lstm_cell_1/biasdense/kernel
dense/bias*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8 *+
f&R$
"__inference_signature_wrapper_9539
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
Õ
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename dense/kernel/Read/ReadVariableOpdense/bias/Read/ReadVariableOpAdamax/iter/Read/ReadVariableOp!Adamax/beta_1/Read/ReadVariableOp!Adamax/beta_2/Read/ReadVariableOp Adamax/decay/Read/ReadVariableOp(Adamax/learning_rate/Read/ReadVariableOp)lstm/lstm_cell/kernel/Read/ReadVariableOp3lstm/lstm_cell/recurrent_kernel/Read/ReadVariableOp'lstm/lstm_cell/bias/Read/ReadVariableOp-lstm_1/lstm_cell_1/kernel/Read/ReadVariableOp7lstm_1/lstm_cell_1/recurrent_kernel/Read/ReadVariableOp+lstm_1/lstm_cell_1/bias/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp)Adamax/dense/kernel/m/Read/ReadVariableOp'Adamax/dense/bias/m/Read/ReadVariableOp2Adamax/lstm/lstm_cell/kernel/m/Read/ReadVariableOp<Adamax/lstm/lstm_cell/recurrent_kernel/m/Read/ReadVariableOp0Adamax/lstm/lstm_cell/bias/m/Read/ReadVariableOp6Adamax/lstm_1/lstm_cell_1/kernel/m/Read/ReadVariableOp@Adamax/lstm_1/lstm_cell_1/recurrent_kernel/m/Read/ReadVariableOp4Adamax/lstm_1/lstm_cell_1/bias/m/Read/ReadVariableOp)Adamax/dense/kernel/v/Read/ReadVariableOp'Adamax/dense/bias/v/Read/ReadVariableOp2Adamax/lstm/lstm_cell/kernel/v/Read/ReadVariableOp<Adamax/lstm/lstm_cell/recurrent_kernel/v/Read/ReadVariableOp0Adamax/lstm/lstm_cell/bias/v/Read/ReadVariableOp6Adamax/lstm_1/lstm_cell_1/kernel/v/Read/ReadVariableOp@Adamax/lstm_1/lstm_cell_1/recurrent_kernel/v/Read/ReadVariableOp4Adamax/lstm_1/lstm_cell_1/bias/v/Read/ReadVariableOpConst*,
Tin%
#2!	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *'
f"R 
__inference__traced_save_11129
ä
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamedense/kernel
dense/biasAdamax/iterAdamax/beta_1Adamax/beta_2Adamax/decayAdamax/learning_ratelstm/lstm_cell/kernellstm/lstm_cell/recurrent_kernellstm/lstm_cell/biaslstm_1/lstm_cell_1/kernel#lstm_1/lstm_cell_1/recurrent_kernellstm_1/lstm_cell_1/biastotalcountAdamax/dense/kernel/mAdamax/dense/bias/mAdamax/lstm/lstm_cell/kernel/m(Adamax/lstm/lstm_cell/recurrent_kernel/mAdamax/lstm/lstm_cell/bias/m"Adamax/lstm_1/lstm_cell_1/kernel/m,Adamax/lstm_1/lstm_cell_1/recurrent_kernel/m Adamax/lstm_1/lstm_cell_1/bias/mAdamax/dense/kernel/vAdamax/dense/bias/vAdamax/lstm/lstm_cell/kernel/v(Adamax/lstm/lstm_cell/recurrent_kernel/vAdamax/lstm/lstm_cell/bias/v"Adamax/lstm_1/lstm_cell_1/kernel/v,Adamax/lstm_1/lstm_cell_1/recurrent_kernel/v Adamax/lstm_1/lstm_cell_1/bias/v*+
Tin$
"2 *
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 **
f%R#
!__inference__traced_restore_11232µ
M

!sequential_lstm_1_while_body_7245@
<sequential_lstm_1_while_sequential_lstm_1_while_loop_counterF
Bsequential_lstm_1_while_sequential_lstm_1_while_maximum_iterations'
#sequential_lstm_1_while_placeholder)
%sequential_lstm_1_while_placeholder_1)
%sequential_lstm_1_while_placeholder_2)
%sequential_lstm_1_while_placeholder_3?
;sequential_lstm_1_while_sequential_lstm_1_strided_slice_1_0{
wsequential_lstm_1_while_tensorarrayv2read_tensorlistgetitem_sequential_lstm_1_tensorarrayunstack_tensorlistfromtensor_0X
Dsequential_lstm_1_while_lstm_cell_1_matmul_readvariableop_resource_0:
Z
Fsequential_lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource_0:
T
Esequential_lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource_0:	$
 sequential_lstm_1_while_identity&
"sequential_lstm_1_while_identity_1&
"sequential_lstm_1_while_identity_2&
"sequential_lstm_1_while_identity_3&
"sequential_lstm_1_while_identity_4&
"sequential_lstm_1_while_identity_5=
9sequential_lstm_1_while_sequential_lstm_1_strided_slice_1y
usequential_lstm_1_while_tensorarrayv2read_tensorlistgetitem_sequential_lstm_1_tensorarrayunstack_tensorlistfromtensorV
Bsequential_lstm_1_while_lstm_cell_1_matmul_readvariableop_resource:
X
Dsequential_lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource:
R
Csequential_lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource:	¢:sequential/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp¢9sequential/lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp¢;sequential/lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp
Isequential/lstm_1/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   
;sequential/lstm_1/while/TensorArrayV2Read/TensorListGetItemTensorListGetItemwsequential_lstm_1_while_tensorarrayv2read_tensorlistgetitem_sequential_lstm_1_tensorarrayunstack_tensorlistfromtensor_0#sequential_lstm_1_while_placeholderRsequential/lstm_1/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0À
9sequential/lstm_1/while/lstm_cell_1/MatMul/ReadVariableOpReadVariableOpDsequential_lstm_1_while_lstm_cell_1_matmul_readvariableop_resource_0* 
_output_shapes
:
*
dtype0î
*sequential/lstm_1/while/lstm_cell_1/MatMulMatMulBsequential/lstm_1/while/TensorArrayV2Read/TensorListGetItem:item:0Asequential/lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÄ
;sequential/lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOpFsequential_lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource_0* 
_output_shapes
:
*
dtype0Õ
,sequential/lstm_1/while/lstm_cell_1/MatMul_1MatMul%sequential_lstm_1_while_placeholder_2Csequential/lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÑ
'sequential/lstm_1/while/lstm_cell_1/addAddV24sequential/lstm_1/while/lstm_cell_1/MatMul:product:06sequential/lstm_1/while/lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ½
:sequential/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOpEsequential_lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource_0*
_output_shapes	
:*
dtype0Ú
+sequential/lstm_1/while/lstm_cell_1/BiasAddBiasAdd+sequential/lstm_1/while/lstm_cell_1/add:z:0Bsequential/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿu
3sequential/lstm_1/while/lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :¦
)sequential/lstm_1/while/lstm_cell_1/splitSplit<sequential/lstm_1/while/lstm_cell_1/split/split_dim:output:04sequential/lstm_1/while/lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_split
+sequential/lstm_1/while/lstm_cell_1/SigmoidSigmoid2sequential/lstm_1/while/lstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
-sequential/lstm_1/while/lstm_cell_1/Sigmoid_1Sigmoid2sequential/lstm_1/while/lstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ»
'sequential/lstm_1/while/lstm_cell_1/mulMul1sequential/lstm_1/while/lstm_cell_1/Sigmoid_1:y:0%sequential_lstm_1_while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
-sequential/lstm_1/while/lstm_cell_1/Sigmoid_2Sigmoid2sequential/lstm_1/while/lstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÇ
)sequential/lstm_1/while/lstm_cell_1/mul_1Mul/sequential/lstm_1/while/lstm_cell_1/Sigmoid:y:01sequential/lstm_1/while/lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÁ
)sequential/lstm_1/while/lstm_cell_1/add_1AddV2+sequential/lstm_1/while/lstm_cell_1/mul:z:0-sequential/lstm_1/while/lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
-sequential/lstm_1/while/lstm_cell_1/Sigmoid_3Sigmoid2sequential/lstm_1/while/lstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
-sequential/lstm_1/while/lstm_cell_1/Sigmoid_4Sigmoid-sequential/lstm_1/while/lstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÉ
)sequential/lstm_1/while/lstm_cell_1/mul_2Mul1sequential/lstm_1/while/lstm_cell_1/Sigmoid_3:y:01sequential/lstm_1/while/lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
<sequential/lstm_1/while/TensorArrayV2Write/TensorListSetItemTensorListSetItem%sequential_lstm_1_while_placeholder_1#sequential_lstm_1_while_placeholder-sequential/lstm_1/while/lstm_cell_1/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒ_
sequential/lstm_1/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :
sequential/lstm_1/while/addAddV2#sequential_lstm_1_while_placeholder&sequential/lstm_1/while/add/y:output:0*
T0*
_output_shapes
: a
sequential/lstm_1/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :¯
sequential/lstm_1/while/add_1AddV2<sequential_lstm_1_while_sequential_lstm_1_while_loop_counter(sequential/lstm_1/while/add_1/y:output:0*
T0*
_output_shapes
: 
 sequential/lstm_1/while/IdentityIdentity!sequential/lstm_1/while/add_1:z:0^sequential/lstm_1/while/NoOp*
T0*
_output_shapes
: ²
"sequential/lstm_1/while/Identity_1IdentityBsequential_lstm_1_while_sequential_lstm_1_while_maximum_iterations^sequential/lstm_1/while/NoOp*
T0*
_output_shapes
: 
"sequential/lstm_1/while/Identity_2Identitysequential/lstm_1/while/add:z:0^sequential/lstm_1/while/NoOp*
T0*
_output_shapes
: Ï
"sequential/lstm_1/while/Identity_3IdentityLsequential/lstm_1/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^sequential/lstm_1/while/NoOp*
T0*
_output_shapes
: :éèÒ¯
"sequential/lstm_1/while/Identity_4Identity-sequential/lstm_1/while/lstm_cell_1/mul_2:z:0^sequential/lstm_1/while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¯
"sequential/lstm_1/while/Identity_5Identity-sequential/lstm_1/while/lstm_cell_1/add_1:z:0^sequential/lstm_1/while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
sequential/lstm_1/while/NoOpNoOp;^sequential/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp:^sequential/lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp<^sequential/lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "M
 sequential_lstm_1_while_identity)sequential/lstm_1/while/Identity:output:0"Q
"sequential_lstm_1_while_identity_1+sequential/lstm_1/while/Identity_1:output:0"Q
"sequential_lstm_1_while_identity_2+sequential/lstm_1/while/Identity_2:output:0"Q
"sequential_lstm_1_while_identity_3+sequential/lstm_1/while/Identity_3:output:0"Q
"sequential_lstm_1_while_identity_4+sequential/lstm_1/while/Identity_4:output:0"Q
"sequential_lstm_1_while_identity_5+sequential/lstm_1/while/Identity_5:output:0"
Csequential_lstm_1_while_lstm_cell_1_biasadd_readvariableop_resourceEsequential_lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource_0"
Dsequential_lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resourceFsequential_lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource_0"
Bsequential_lstm_1_while_lstm_cell_1_matmul_readvariableop_resourceDsequential_lstm_1_while_lstm_cell_1_matmul_readvariableop_resource_0"x
9sequential_lstm_1_while_sequential_lstm_1_strided_slice_1;sequential_lstm_1_while_sequential_lstm_1_strided_slice_1_0"ð
usequential_lstm_1_while_tensorarrayv2read_tensorlistgetitem_sequential_lstm_1_tensorarrayunstack_tensorlistfromtensorwsequential_lstm_1_while_tensorarrayv2read_tensorlistgetitem_sequential_lstm_1_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2x
:sequential/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp:sequential/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp2v
9sequential/lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp9sequential/lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp2z
;sequential/lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp;sequential/lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
"
Â
while_body_7416
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0)
while_lstm_cell_7440_0:	Ø*
while_lstm_cell_7442_0:
Ø%
while_lstm_cell_7444_0:	Ø
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor'
while_lstm_cell_7440:	Ø(
while_lstm_cell_7442:
Ø#
while_lstm_cell_7444:	Ø¢'while/lstm_cell/StatefulPartitionedCall
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0¢
'while/lstm_cell/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_placeholder_3while_lstm_cell_7440_0while_lstm_cell_7442_0while_lstm_cell_7444_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *P
_output_shapes>
<:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_7402Ù
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder0while/lstm_cell/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒ
while/Identity_4Identity0while/lstm_cell/StatefulPartitionedCall:output:1^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/Identity_5Identity0while/lstm_cell/StatefulPartitionedCall:output:2^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv

while/NoOpNoOp(^while/lstm_cell/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0".
while_lstm_cell_7440while_lstm_cell_7440_0".
while_lstm_cell_7442while_lstm_cell_7442_0".
while_lstm_cell_7444while_lstm_cell_7444_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2R
'while/lstm_cell/StatefulPartitionedCall'while/lstm_cell/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
ÑE
Ù
__inference__traced_save_11129
file_prefix+
'savev2_dense_kernel_read_readvariableop)
%savev2_dense_bias_read_readvariableop*
&savev2_adamax_iter_read_readvariableop	,
(savev2_adamax_beta_1_read_readvariableop,
(savev2_adamax_beta_2_read_readvariableop+
'savev2_adamax_decay_read_readvariableop3
/savev2_adamax_learning_rate_read_readvariableop4
0savev2_lstm_lstm_cell_kernel_read_readvariableop>
:savev2_lstm_lstm_cell_recurrent_kernel_read_readvariableop2
.savev2_lstm_lstm_cell_bias_read_readvariableop8
4savev2_lstm_1_lstm_cell_1_kernel_read_readvariableopB
>savev2_lstm_1_lstm_cell_1_recurrent_kernel_read_readvariableop6
2savev2_lstm_1_lstm_cell_1_bias_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop4
0savev2_adamax_dense_kernel_m_read_readvariableop2
.savev2_adamax_dense_bias_m_read_readvariableop=
9savev2_adamax_lstm_lstm_cell_kernel_m_read_readvariableopG
Csavev2_adamax_lstm_lstm_cell_recurrent_kernel_m_read_readvariableop;
7savev2_adamax_lstm_lstm_cell_bias_m_read_readvariableopA
=savev2_adamax_lstm_1_lstm_cell_1_kernel_m_read_readvariableopK
Gsavev2_adamax_lstm_1_lstm_cell_1_recurrent_kernel_m_read_readvariableop?
;savev2_adamax_lstm_1_lstm_cell_1_bias_m_read_readvariableop4
0savev2_adamax_dense_kernel_v_read_readvariableop2
.savev2_adamax_dense_bias_v_read_readvariableop=
9savev2_adamax_lstm_lstm_cell_kernel_v_read_readvariableopG
Csavev2_adamax_lstm_lstm_cell_recurrent_kernel_v_read_readvariableop;
7savev2_adamax_lstm_lstm_cell_bias_v_read_readvariableopA
=savev2_adamax_lstm_1_lstm_cell_1_kernel_v_read_readvariableopK
Gsavev2_adamax_lstm_1_lstm_cell_1_recurrent_kernel_v_read_readvariableop?
;savev2_adamax_lstm_1_lstm_cell_1_bias_v_read_readvariableop
savev2_const

identity_1¢MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: µ
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
: *
dtype0*Þ
valueÔBÑ B6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH­
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
: *
dtype0*S
valueJBH B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B Á
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0'savev2_dense_kernel_read_readvariableop%savev2_dense_bias_read_readvariableop&savev2_adamax_iter_read_readvariableop(savev2_adamax_beta_1_read_readvariableop(savev2_adamax_beta_2_read_readvariableop'savev2_adamax_decay_read_readvariableop/savev2_adamax_learning_rate_read_readvariableop0savev2_lstm_lstm_cell_kernel_read_readvariableop:savev2_lstm_lstm_cell_recurrent_kernel_read_readvariableop.savev2_lstm_lstm_cell_bias_read_readvariableop4savev2_lstm_1_lstm_cell_1_kernel_read_readvariableop>savev2_lstm_1_lstm_cell_1_recurrent_kernel_read_readvariableop2savev2_lstm_1_lstm_cell_1_bias_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop0savev2_adamax_dense_kernel_m_read_readvariableop.savev2_adamax_dense_bias_m_read_readvariableop9savev2_adamax_lstm_lstm_cell_kernel_m_read_readvariableopCsavev2_adamax_lstm_lstm_cell_recurrent_kernel_m_read_readvariableop7savev2_adamax_lstm_lstm_cell_bias_m_read_readvariableop=savev2_adamax_lstm_1_lstm_cell_1_kernel_m_read_readvariableopGsavev2_adamax_lstm_1_lstm_cell_1_recurrent_kernel_m_read_readvariableop;savev2_adamax_lstm_1_lstm_cell_1_bias_m_read_readvariableop0savev2_adamax_dense_kernel_v_read_readvariableop.savev2_adamax_dense_bias_v_read_readvariableop9savev2_adamax_lstm_lstm_cell_kernel_v_read_readvariableopCsavev2_adamax_lstm_lstm_cell_recurrent_kernel_v_read_readvariableop7savev2_adamax_lstm_lstm_cell_bias_v_read_readvariableop=savev2_adamax_lstm_1_lstm_cell_1_kernel_v_read_readvariableopGsavev2_adamax_lstm_1_lstm_cell_1_recurrent_kernel_v_read_readvariableop;savev2_adamax_lstm_1_lstm_cell_1_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *.
dtypes$
"2 	
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*
_input_shapesÿ
ü: :	:: : : : : :	Ø:
Ø:Ø:
:
:: : :	::	Ø:
Ø:Ø:
:
::	::	Ø:
Ø:Ø:
:
:: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :%!

_output_shapes
:	Ø:&	"
 
_output_shapes
:
Ø:!


_output_shapes	
:Ø:&"
 
_output_shapes
:
:&"
 
_output_shapes
:
:!

_output_shapes	
::

_output_shapes
: :

_output_shapes
: :%!

_output_shapes
:	: 

_output_shapes
::%!

_output_shapes
:	Ø:&"
 
_output_shapes
:
Ø:!

_output_shapes	
:Ø:&"
 
_output_shapes
:
:&"
 
_output_shapes
:
:!

_output_shapes	
::%!

_output_shapes
:	: 

_output_shapes
::%!

_output_shapes
:	Ø:&"
 
_output_shapes
:
Ø:!

_output_shapes	
:Ø:&"
 
_output_shapes
:
:&"
 
_output_shapes
:
:!

_output_shapes	
:: 

_output_shapes
: 
×	
Æ
)__inference_sequential_layer_call_fn_8910

inputs
unknown:	Ø
	unknown_0:
Ø
	unknown_1:	Ø
	unknown_2:

	unknown_3:

	unknown_4:	
	unknown_5:	
	unknown_6:
identity¢StatefulPartitionedCallª
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_sequential_layer_call_and_return_conditional_losses_8366o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿ: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
I

>__inference_lstm_layer_call_and_return_conditional_losses_8739

inputs;
(lstm_cell_matmul_readvariableop_resource:	Ø>
*lstm_cell_matmul_1_readvariableop_resource:
Ø8
)lstm_cell_biasadd_readvariableop_resource:	Ø
identity¢ lstm_cell/BiasAdd/ReadVariableOp¢lstm_cell/MatMul/ReadVariableOp¢!lstm_cell/MatMul_1/ReadVariableOp¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          m
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
lstm_cell/MatMul/ReadVariableOpReadVariableOp(lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0
lstm_cell/MatMulMatMulstrided_slice_2:output:0'lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
!lstm_cell/MatMul_1/ReadVariableOpReadVariableOp*lstm_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0
lstm_cell/MatMul_1MatMulzeros:output:0)lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
lstm_cell/addAddV2lstm_cell/MatMul:product:0lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
 lstm_cell/BiasAdd/ReadVariableOpReadVariableOp)lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0
lstm_cell/BiasAddBiasAddlstm_cell/add:z:0(lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ[
lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :Ø
lstm_cell/splitSplit"lstm_cell/split/split_dim:output:0lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_spliti
lstm_cell/SigmoidSigmoidlstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
lstm_cell/Sigmoid_1Sigmoidlstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
lstm_cell/mulMullstm_cell/Sigmoid_1:y:0zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
lstm_cell/ReluRelulstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
lstm_cell/mul_1Mullstm_cell/Sigmoid:y:0lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
lstm_cell/add_1AddV2lstm_cell/mul:z:0lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
lstm_cell/Sigmoid_2Sigmoidlstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
lstm_cell/Relu_1Relulstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell/mul_2Mullstm_cell/Sigmoid_2:y:0lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ù
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0(lstm_cell_matmul_readvariableop_resource*lstm_cell_matmul_1_readvariableop_resource)lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_8655*
condR
while_cond_8654*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ã
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    c
IdentityIdentitytranspose_1:y:0^NoOp*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ·
NoOpNoOp!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : 2D
 lstm_cell/BiasAdd/ReadVariableOp lstm_cell/BiasAdd/ReadVariableOp2B
lstm_cell/MatMul/ReadVariableOplstm_cell/MatMul/ReadVariableOp2F
!lstm_cell/MatMul_1/ReadVariableOp!lstm_cell/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¯
¹
while_cond_8466
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_8466___redundant_placeholder02
.while_while_cond_8466___redundant_placeholder12
.while_while_cond_8466___redundant_placeholder22
.while_while_cond_8466___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
@
©

lstm_1_while_body_9130*
&lstm_1_while_lstm_1_while_loop_counter0
,lstm_1_while_lstm_1_while_maximum_iterations
lstm_1_while_placeholder
lstm_1_while_placeholder_1
lstm_1_while_placeholder_2
lstm_1_while_placeholder_3)
%lstm_1_while_lstm_1_strided_slice_1_0e
alstm_1_while_tensorarrayv2read_tensorlistgetitem_lstm_1_tensorarrayunstack_tensorlistfromtensor_0M
9lstm_1_while_lstm_cell_1_matmul_readvariableop_resource_0:
O
;lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource_0:
I
:lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource_0:	
lstm_1_while_identity
lstm_1_while_identity_1
lstm_1_while_identity_2
lstm_1_while_identity_3
lstm_1_while_identity_4
lstm_1_while_identity_5'
#lstm_1_while_lstm_1_strided_slice_1c
_lstm_1_while_tensorarrayv2read_tensorlistgetitem_lstm_1_tensorarrayunstack_tensorlistfromtensorK
7lstm_1_while_lstm_cell_1_matmul_readvariableop_resource:
M
9lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource:
G
8lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource:	¢/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp¢.lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp¢0lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp
>lstm_1/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ê
0lstm_1/while/TensorArrayV2Read/TensorListGetItemTensorListGetItemalstm_1_while_tensorarrayv2read_tensorlistgetitem_lstm_1_tensorarrayunstack_tensorlistfromtensor_0lstm_1_while_placeholderGlstm_1/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0ª
.lstm_1/while/lstm_cell_1/MatMul/ReadVariableOpReadVariableOp9lstm_1_while_lstm_cell_1_matmul_readvariableop_resource_0* 
_output_shapes
:
*
dtype0Í
lstm_1/while/lstm_cell_1/MatMulMatMul7lstm_1/while/TensorArrayV2Read/TensorListGetItem:item:06lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ®
0lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp;lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource_0* 
_output_shapes
:
*
dtype0´
!lstm_1/while/lstm_cell_1/MatMul_1MatMullstm_1_while_placeholder_28lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ°
lstm_1/while/lstm_cell_1/addAddV2)lstm_1/while/lstm_cell_1/MatMul:product:0+lstm_1/while/lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ§
/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp:lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource_0*
_output_shapes	
:*
dtype0¹
 lstm_1/while/lstm_cell_1/BiasAddBiasAdd lstm_1/while/lstm_cell_1/add:z:07lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
(lstm_1/while/lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :
lstm_1/while/lstm_cell_1/splitSplit1lstm_1/while/lstm_cell_1/split/split_dim:output:0)lstm_1/while/lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_split
 lstm_1/while/lstm_cell_1/SigmoidSigmoid'lstm_1/while/lstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_1/while/lstm_cell_1/Sigmoid_1Sigmoid'lstm_1/while/lstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/while/lstm_cell_1/mulMul&lstm_1/while/lstm_cell_1/Sigmoid_1:y:0lstm_1_while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_1/while/lstm_cell_1/Sigmoid_2Sigmoid'lstm_1/while/lstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¦
lstm_1/while/lstm_cell_1/mul_1Mul$lstm_1/while/lstm_cell_1/Sigmoid:y:0&lstm_1/while/lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
lstm_1/while/lstm_cell_1/add_1AddV2 lstm_1/while/lstm_cell_1/mul:z:0"lstm_1/while/lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_1/while/lstm_cell_1/Sigmoid_3Sigmoid'lstm_1/while/lstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_1/while/lstm_cell_1/Sigmoid_4Sigmoid"lstm_1/while/lstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¨
lstm_1/while/lstm_cell_1/mul_2Mul&lstm_1/while/lstm_cell_1/Sigmoid_3:y:0&lstm_1/while/lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿà
1lstm_1/while/TensorArrayV2Write/TensorListSetItemTensorListSetItemlstm_1_while_placeholder_1lstm_1_while_placeholder"lstm_1/while/lstm_cell_1/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒT
lstm_1/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :q
lstm_1/while/addAddV2lstm_1_while_placeholderlstm_1/while/add/y:output:0*
T0*
_output_shapes
: V
lstm_1/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :
lstm_1/while/add_1AddV2&lstm_1_while_lstm_1_while_loop_counterlstm_1/while/add_1/y:output:0*
T0*
_output_shapes
: n
lstm_1/while/IdentityIdentitylstm_1/while/add_1:z:0^lstm_1/while/NoOp*
T0*
_output_shapes
: 
lstm_1/while/Identity_1Identity,lstm_1_while_lstm_1_while_maximum_iterations^lstm_1/while/NoOp*
T0*
_output_shapes
: n
lstm_1/while/Identity_2Identitylstm_1/while/add:z:0^lstm_1/while/NoOp*
T0*
_output_shapes
: ®
lstm_1/while/Identity_3IdentityAlstm_1/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^lstm_1/while/NoOp*
T0*
_output_shapes
: :éèÒ
lstm_1/while/Identity_4Identity"lstm_1/while/lstm_cell_1/mul_2:z:0^lstm_1/while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/while/Identity_5Identity"lstm_1/while/lstm_cell_1/add_1:z:0^lstm_1/while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿé
lstm_1/while/NoOpNoOp0^lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp/^lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp1^lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "7
lstm_1_while_identitylstm_1/while/Identity:output:0";
lstm_1_while_identity_1 lstm_1/while/Identity_1:output:0";
lstm_1_while_identity_2 lstm_1/while/Identity_2:output:0";
lstm_1_while_identity_3 lstm_1/while/Identity_3:output:0";
lstm_1_while_identity_4 lstm_1/while/Identity_4:output:0";
lstm_1_while_identity_5 lstm_1/while/Identity_5:output:0"L
#lstm_1_while_lstm_1_strided_slice_1%lstm_1_while_lstm_1_strided_slice_1_0"v
8lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource:lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource_0"x
9lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource;lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource_0"t
7lstm_1_while_lstm_cell_1_matmul_readvariableop_resource9lstm_1_while_lstm_cell_1_matmul_readvariableop_resource_0"Ä
_lstm_1_while_tensorarrayv2read_tensorlistgetitem_lstm_1_tensorarrayunstack_tensorlistfromtensoralstm_1_while_tensorarrayv2read_tensorlistgetitem_lstm_1_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2b
/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp2`
.lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp.lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp2d
0lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp0lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
á
µ
D__inference_sequential_layer_call_and_return_conditional_losses_8859

lstm_input
	lstm_8838:	Ø
	lstm_8840:
Ø
	lstm_8842:	Ø
lstm_1_8846:

lstm_1_8848:

lstm_1_8850:	

dense_8853:	

dense_8855:
identity¢dense/StatefulPartitionedCall¢lstm/StatefulPartitionedCall¢lstm_1/StatefulPartitionedCalló
lstm/StatefulPartitionedCallStatefulPartitionedCall
lstm_input	lstm_8838	lstm_8840	lstm_8842*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *G
fBR@
>__inference_lstm_layer_call_and_return_conditional_losses_8184Û
dropout/PartitionedCallPartitionedCall%lstm/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_8197
lstm_1/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0lstm_1_8846lstm_1_8848lstm_1_8850*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_lstm_1_layer_call_and_return_conditional_losses_8341
dense/StatefulPartitionedCallStatefulPartitionedCall'lstm_1/StatefulPartitionedCall:output:0
dense_8853
dense_8855*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *H
fCRA
?__inference_dense_layer_call_and_return_conditional_losses_8359u
IdentityIdentity&dense/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¦
NoOpNoOp^dense/StatefulPartitionedCall^lstm/StatefulPartitionedCall^lstm_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿ: : : : : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2<
lstm/StatefulPartitionedCalllstm/StatefulPartitionedCall2@
lstm_1/StatefulPartitionedCalllstm_1/StatefulPartitionedCall:W S
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
$
_user_specified_name
lstm_input
ç6
µ
while_body_8100
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0C
0while_lstm_cell_matmul_readvariableop_resource_0:	ØF
2while_lstm_cell_matmul_1_readvariableop_resource_0:
Ø@
1while_lstm_cell_biasadd_readvariableop_resource_0:	Ø
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorA
.while_lstm_cell_matmul_readvariableop_resource:	ØD
0while_lstm_cell_matmul_1_readvariableop_resource:
Ø>
/while_lstm_cell_biasadd_readvariableop_resource:	Ø¢&while/lstm_cell/BiasAdd/ReadVariableOp¢%while/lstm_cell/MatMul/ReadVariableOp¢'while/lstm_cell/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
%while/lstm_cell/MatMul/ReadVariableOpReadVariableOp0while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	Ø*
dtype0´
while/lstm_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0-while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
'while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp2while_lstm_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
Ø*
dtype0
while/lstm_cell/MatMul_1MatMulwhile_placeholder_2/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
while/lstm_cell/addAddV2 while/lstm_cell/MatMul:product:0"while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
&while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp1while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:Ø*
dtype0
while/lstm_cell/BiasAddBiasAddwhile/lstm_cell/add:z:0.while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØa
while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ê
while/lstm_cell/splitSplit(while/lstm_cell/split/split_dim:output:0 while/lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitu
while/lstm_cell/SigmoidSigmoidwhile/lstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/lstm_cell/Sigmoid_1Sigmoidwhile/lstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mulMulwhile/lstm_cell/Sigmoid_1:y:0while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
while/lstm_cell/ReluReluwhile/lstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mul_1Mulwhile/lstm_cell/Sigmoid:y:0"while/lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/add_1AddV2while/lstm_cell/mul:z:0while/lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/lstm_cell/Sigmoid_2Sigmoidwhile/lstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
while/lstm_cell/Relu_1Reluwhile/lstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mul_2Mulwhile/lstm_cell/Sigmoid_2:y:0$while/lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÂ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒw
while/Identity_4Identitywhile/lstm_cell/mul_2:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/Identity_5Identitywhile/lstm_cell/add_1:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÇ

while/NoOpNoOp'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"d
/while_lstm_cell_biasadd_readvariableop_resource1while_lstm_cell_biasadd_readvariableop_resource_0"f
0while_lstm_cell_matmul_1_readvariableop_resource2while_lstm_cell_matmul_1_readvariableop_resource_0"b
.while_lstm_cell_matmul_readvariableop_resource0while_lstm_cell_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2P
&while/lstm_cell/BiasAdd/ReadVariableOp&while/lstm_cell/BiasAdd/ReadVariableOp2N
%while/lstm_cell/MatMul/ReadVariableOp%while/lstm_cell/MatMul/ReadVariableOp2R
'while/lstm_cell/MatMul_1/ReadVariableOp'while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
ü7
ú
@__inference_lstm_1_layer_call_and_return_conditional_losses_8026

inputs$
lstm_cell_1_7944:
$
lstm_cell_1_7946:

lstm_cell_1_7948:	
identity¢#lstm_cell_1/StatefulPartitionedCall¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          w
	transpose	Transposeinputstranspose/perm:output:0*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ê
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maskî
#lstm_cell_1/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0zeros_1:output:0lstm_cell_1_7944lstm_cell_1_7946lstm_cell_1_7948*
Tin

2*
Tout
2*
_collective_manager_ids
 *P
_output_shapes>
<:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_lstm_cell_1_layer_call_and_return_conditional_losses_7898n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ®
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0lstm_cell_1_7944lstm_cell_1_7946lstm_cell_1_7948*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_7957*
condR
while_cond_7956*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ì
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"           
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿt
NoOpNoOp$^lstm_cell_1/StatefulPartitionedCall^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : 2J
#lstm_cell_1/StatefulPartitionedCall#lstm_cell_1/StatefulPartitionedCall2
whilewhile:] Y
5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ÀJ

A__inference_lstm_1_layer_call_and_return_conditional_losses_10369
inputs_0>
*lstm_cell_1_matmul_readvariableop_resource:
@
,lstm_cell_1_matmul_1_readvariableop_resource:
:
+lstm_cell_1_biasadd_readvariableop_resource:	
identity¢"lstm_cell_1/BiasAdd/ReadVariableOp¢!lstm_cell_1/MatMul/ReadVariableOp¢#lstm_cell_1/MatMul_1/ReadVariableOp¢while=
ShapeShapeinputs_0*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          y
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ê
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
!lstm_cell_1/MatMul/ReadVariableOpReadVariableOp*lstm_cell_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
lstm_cell_1/MatMulMatMulstrided_slice_2:output:0)lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
#lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp,lstm_cell_1_matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0
lstm_cell_1/MatMul_1MatMulzeros:output:0+lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/addAddV2lstm_cell_1/MatMul:product:0lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp+lstm_cell_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
lstm_cell_1/BiasAddBiasAddlstm_cell_1/add:z:0*lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :Þ
lstm_cell_1/splitSplit$lstm_cell_1/split/split_dim:output:0lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitm
lstm_cell_1/SigmoidSigmoidlstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_1Sigmoidlstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
lstm_cell_1/mulMullstm_cell_1/Sigmoid_1:y:0zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_2Sigmoidlstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/mul_1Mullstm_cell_1/Sigmoid:y:0lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
lstm_cell_1/add_1AddV2lstm_cell_1/mul:z:0lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_3Sigmoidlstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
lstm_cell_1/Sigmoid_4Sigmoidlstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/mul_2Mullstm_cell_1/Sigmoid_3:y:0lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0*lstm_cell_1_matmul_readvariableop_resource,lstm_cell_1_matmul_1_readvariableop_resource+lstm_cell_1_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_10285*
condR
while_cond_10284*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ì
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"           
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ½
NoOpNoOp#^lstm_cell_1/BiasAdd/ReadVariableOp"^lstm_cell_1/MatMul/ReadVariableOp$^lstm_cell_1/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : 2H
"lstm_cell_1/BiasAdd/ReadVariableOp"lstm_cell_1/BiasAdd/ReadVariableOp2F
!lstm_cell_1/MatMul/ReadVariableOp!lstm_cell_1/MatMul/ReadVariableOp2J
#lstm_cell_1/MatMul_1/ReadVariableOp#lstm_cell_1/MatMul_1/ReadVariableOp2
whilewhile:_ [
5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0
J

A__inference_lstm_1_layer_call_and_return_conditional_losses_10798

inputs>
*lstm_cell_1_matmul_readvariableop_resource:
@
,lstm_cell_1_matmul_1_readvariableop_resource:
:
+lstm_cell_1_biasadd_readvariableop_resource:	
identity¢"lstm_cell_1/BiasAdd/ReadVariableOp¢!lstm_cell_1/MatMul/ReadVariableOp¢#lstm_cell_1/MatMul_1/ReadVariableOp¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          n
	transpose	Transposeinputstranspose/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ê
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
!lstm_cell_1/MatMul/ReadVariableOpReadVariableOp*lstm_cell_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
lstm_cell_1/MatMulMatMulstrided_slice_2:output:0)lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
#lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp,lstm_cell_1_matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0
lstm_cell_1/MatMul_1MatMulzeros:output:0+lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/addAddV2lstm_cell_1/MatMul:product:0lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp+lstm_cell_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
lstm_cell_1/BiasAddBiasAddlstm_cell_1/add:z:0*lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :Þ
lstm_cell_1/splitSplit$lstm_cell_1/split/split_dim:output:0lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitm
lstm_cell_1/SigmoidSigmoidlstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_1Sigmoidlstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
lstm_cell_1/mulMullstm_cell_1/Sigmoid_1:y:0zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_2Sigmoidlstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/mul_1Mullstm_cell_1/Sigmoid:y:0lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
lstm_cell_1/add_1AddV2lstm_cell_1/mul:z:0lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_3Sigmoidlstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
lstm_cell_1/Sigmoid_4Sigmoidlstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/mul_2Mullstm_cell_1/Sigmoid_3:y:0lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0*lstm_cell_1_matmul_readvariableop_resource,lstm_cell_1_matmul_1_readvariableop_resource+lstm_cell_1_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_10714*
condR
while_cond_10713*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ã
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ½
NoOpNoOp#^lstm_cell_1/BiasAdd/ReadVariableOp"^lstm_cell_1/MatMul/ReadVariableOp$^lstm_cell_1/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:ÿÿÿÿÿÿÿÿÿ: : : 2H
"lstm_cell_1/BiasAdd/ReadVariableOp"lstm_cell_1/BiasAdd/ReadVariableOp2F
!lstm_cell_1/MatMul/ReadVariableOp!lstm_cell_1/MatMul/ReadVariableOp2J
#lstm_cell_1/MatMul_1/ReadVariableOp#lstm_cell_1/MatMul_1/ReadVariableOp2
whilewhile:T P
,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¯
¹
while_cond_8099
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_8099___redundant_placeholder02
.while_while_cond_8099___redundant_placeholder12
.while_while_cond_8099___redundant_placeholder22
.while_while_cond_8099___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
¯
¹
while_cond_9784
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_9784___redundant_placeholder02
.while_while_cond_9784___redundant_placeholder12
.while_while_cond_9784___redundant_placeholder22
.while_while_cond_9784___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
ð~
ã
!__inference__traced_restore_11232
file_prefix0
assignvariableop_dense_kernel:	+
assignvariableop_1_dense_bias:(
assignvariableop_2_adamax_iter:	 *
 assignvariableop_3_adamax_beta_1: *
 assignvariableop_4_adamax_beta_2: )
assignvariableop_5_adamax_decay: 1
'assignvariableop_6_adamax_learning_rate: ;
(assignvariableop_7_lstm_lstm_cell_kernel:	ØF
2assignvariableop_8_lstm_lstm_cell_recurrent_kernel:
Ø5
&assignvariableop_9_lstm_lstm_cell_bias:	ØA
-assignvariableop_10_lstm_1_lstm_cell_1_kernel:
K
7assignvariableop_11_lstm_1_lstm_cell_1_recurrent_kernel:
:
+assignvariableop_12_lstm_1_lstm_cell_1_bias:	#
assignvariableop_13_total: #
assignvariableop_14_count: <
)assignvariableop_15_adamax_dense_kernel_m:	5
'assignvariableop_16_adamax_dense_bias_m:E
2assignvariableop_17_adamax_lstm_lstm_cell_kernel_m:	ØP
<assignvariableop_18_adamax_lstm_lstm_cell_recurrent_kernel_m:
Ø?
0assignvariableop_19_adamax_lstm_lstm_cell_bias_m:	ØJ
6assignvariableop_20_adamax_lstm_1_lstm_cell_1_kernel_m:
T
@assignvariableop_21_adamax_lstm_1_lstm_cell_1_recurrent_kernel_m:
C
4assignvariableop_22_adamax_lstm_1_lstm_cell_1_bias_m:	<
)assignvariableop_23_adamax_dense_kernel_v:	5
'assignvariableop_24_adamax_dense_bias_v:E
2assignvariableop_25_adamax_lstm_lstm_cell_kernel_v:	ØP
<assignvariableop_26_adamax_lstm_lstm_cell_recurrent_kernel_v:
Ø?
0assignvariableop_27_adamax_lstm_lstm_cell_bias_v:	ØJ
6assignvariableop_28_adamax_lstm_1_lstm_cell_1_kernel_v:
T
@assignvariableop_29_adamax_lstm_1_lstm_cell_1_recurrent_kernel_v:
C
4assignvariableop_30_adamax_lstm_1_lstm_cell_1_bias_v:	
identity_32¢AssignVariableOp¢AssignVariableOp_1¢AssignVariableOp_10¢AssignVariableOp_11¢AssignVariableOp_12¢AssignVariableOp_13¢AssignVariableOp_14¢AssignVariableOp_15¢AssignVariableOp_16¢AssignVariableOp_17¢AssignVariableOp_18¢AssignVariableOp_19¢AssignVariableOp_2¢AssignVariableOp_20¢AssignVariableOp_21¢AssignVariableOp_22¢AssignVariableOp_23¢AssignVariableOp_24¢AssignVariableOp_25¢AssignVariableOp_26¢AssignVariableOp_27¢AssignVariableOp_28¢AssignVariableOp_29¢AssignVariableOp_3¢AssignVariableOp_30¢AssignVariableOp_4¢AssignVariableOp_5¢AssignVariableOp_6¢AssignVariableOp_7¢AssignVariableOp_8¢AssignVariableOp_9¸
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
: *
dtype0*Þ
valueÔBÑ B6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH°
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
: *
dtype0*S
valueJBH B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B Á
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*
_output_shapes
::::::::::::::::::::::::::::::::*.
dtypes$
"2 	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOpAssignVariableOpassignvariableop_dense_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_1AssignVariableOpassignvariableop_1_dense_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0	*
_output_shapes
:
AssignVariableOp_2AssignVariableOpassignvariableop_2_adamax_iterIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_3AssignVariableOp assignvariableop_3_adamax_beta_1Identity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_4AssignVariableOp assignvariableop_4_adamax_beta_2Identity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_5AssignVariableOpassignvariableop_5_adamax_decayIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_6AssignVariableOp'assignvariableop_6_adamax_learning_rateIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_7AssignVariableOp(assignvariableop_7_lstm_lstm_cell_kernelIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:¡
AssignVariableOp_8AssignVariableOp2assignvariableop_8_lstm_lstm_cell_recurrent_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_9AssignVariableOp&assignvariableop_9_lstm_lstm_cell_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_10AssignVariableOp-assignvariableop_10_lstm_1_lstm_cell_1_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_11AssignVariableOp7assignvariableop_11_lstm_1_lstm_cell_1_recurrent_kernelIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_12AssignVariableOp+assignvariableop_12_lstm_1_lstm_cell_1_biasIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_13AssignVariableOpassignvariableop_13_totalIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_14AssignVariableOpassignvariableop_14_countIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_15AssignVariableOp)assignvariableop_15_adamax_dense_kernel_mIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_16AssignVariableOp'assignvariableop_16_adamax_dense_bias_mIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:£
AssignVariableOp_17AssignVariableOp2assignvariableop_17_adamax_lstm_lstm_cell_kernel_mIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_18AssignVariableOp<assignvariableop_18_adamax_lstm_lstm_cell_recurrent_kernel_mIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:¡
AssignVariableOp_19AssignVariableOp0assignvariableop_19_adamax_lstm_lstm_cell_bias_mIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_20AssignVariableOp6assignvariableop_20_adamax_lstm_1_lstm_cell_1_kernel_mIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:±
AssignVariableOp_21AssignVariableOp@assignvariableop_21_adamax_lstm_1_lstm_cell_1_recurrent_kernel_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:¥
AssignVariableOp_22AssignVariableOp4assignvariableop_22_adamax_lstm_1_lstm_cell_1_bias_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_23AssignVariableOp)assignvariableop_23_adamax_dense_kernel_vIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_24AssignVariableOp'assignvariableop_24_adamax_dense_bias_vIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:£
AssignVariableOp_25AssignVariableOp2assignvariableop_25_adamax_lstm_lstm_cell_kernel_vIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_26AssignVariableOp<assignvariableop_26_adamax_lstm_lstm_cell_recurrent_kernel_vIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:¡
AssignVariableOp_27AssignVariableOp0assignvariableop_27_adamax_lstm_lstm_cell_bias_vIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_28AssignVariableOp6assignvariableop_28_adamax_lstm_1_lstm_cell_1_kernel_vIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:±
AssignVariableOp_29AssignVariableOp@assignvariableop_29_adamax_lstm_1_lstm_cell_1_recurrent_kernel_vIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:¥
AssignVariableOp_30AssignVariableOp4assignvariableop_30_adamax_lstm_1_lstm_cell_1_bias_vIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 ù
Identity_31Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_32IdentityIdentity_31:output:0^NoOp_1*
T0*
_output_shapes
: æ
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_32Identity_32:output:0*S
_input_shapesB
@: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
¯
¹
while_cond_7606
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_7606___redundant_placeholder02
.while_while_cond_7606___redundant_placeholder12
.while_while_cond_7606___redundant_placeholder22
.while_while_cond_7606___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:

·
&__inference_lstm_1_layer_call_fn_10193
inputs_0
unknown:

	unknown_0:

	unknown_1:	
identity¢StatefulPartitionedCallè
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_lstm_1_layer_call_and_return_conditional_losses_7835p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:_ [
5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0
ÁI

>__inference_lstm_layer_call_and_return_conditional_losses_9869
inputs_0;
(lstm_cell_matmul_readvariableop_resource:	Ø>
*lstm_cell_matmul_1_readvariableop_resource:
Ø8
)lstm_cell_biasadd_readvariableop_resource:	Ø
identity¢ lstm_cell/BiasAdd/ReadVariableOp¢lstm_cell/MatMul/ReadVariableOp¢!lstm_cell/MatMul_1/ReadVariableOp¢while=
ShapeShapeinputs_0*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          x
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
lstm_cell/MatMul/ReadVariableOpReadVariableOp(lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0
lstm_cell/MatMulMatMulstrided_slice_2:output:0'lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
!lstm_cell/MatMul_1/ReadVariableOpReadVariableOp*lstm_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0
lstm_cell/MatMul_1MatMulzeros:output:0)lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
lstm_cell/addAddV2lstm_cell/MatMul:product:0lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
 lstm_cell/BiasAdd/ReadVariableOpReadVariableOp)lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0
lstm_cell/BiasAddBiasAddlstm_cell/add:z:0(lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ[
lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :Ø
lstm_cell/splitSplit"lstm_cell/split/split_dim:output:0lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_spliti
lstm_cell/SigmoidSigmoidlstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
lstm_cell/Sigmoid_1Sigmoidlstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
lstm_cell/mulMullstm_cell/Sigmoid_1:y:0zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
lstm_cell/ReluRelulstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
lstm_cell/mul_1Mullstm_cell/Sigmoid:y:0lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
lstm_cell/add_1AddV2lstm_cell/mul:z:0lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
lstm_cell/Sigmoid_2Sigmoidlstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
lstm_cell/Relu_1Relulstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell/mul_2Mullstm_cell/Sigmoid_2:y:0lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ù
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0(lstm_cell_matmul_readvariableop_resource*lstm_cell_matmul_1_readvariableop_resource)lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_9785*
condR
while_cond_9784*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ì
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"           
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    l
IdentityIdentitytranspose_1:y:0^NoOp*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ·
NoOpNoOp!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : 2D
 lstm_cell/BiasAdd/ReadVariableOp lstm_cell/BiasAdd/ReadVariableOp2B
lstm_cell/MatMul/ReadVariableOplstm_cell/MatMul/ReadVariableOp2F
!lstm_cell/MatMul_1/ReadVariableOp!lstm_cell/MatMul_1/ReadVariableOp2
whilewhile:^ Z
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0
ã	
Ê
)__inference_sequential_layer_call_fn_8835

lstm_input
unknown:	Ø
	unknown_0:
Ø
	unknown_1:	Ø
	unknown_2:

	unknown_3:

	unknown_4:	
	unknown_5:	
	unknown_6:
identity¢StatefulPartitionedCall®
StatefulPartitionedCallStatefulPartitionedCall
lstm_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_sequential_layer_call_and_return_conditional_losses_8795o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿ: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
$
_user_specified_name
lstm_input
J

@__inference_lstm_1_layer_call_and_return_conditional_losses_8551

inputs>
*lstm_cell_1_matmul_readvariableop_resource:
@
,lstm_cell_1_matmul_1_readvariableop_resource:
:
+lstm_cell_1_biasadd_readvariableop_resource:	
identity¢"lstm_cell_1/BiasAdd/ReadVariableOp¢!lstm_cell_1/MatMul/ReadVariableOp¢#lstm_cell_1/MatMul_1/ReadVariableOp¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          n
	transpose	Transposeinputstranspose/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ê
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
!lstm_cell_1/MatMul/ReadVariableOpReadVariableOp*lstm_cell_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
lstm_cell_1/MatMulMatMulstrided_slice_2:output:0)lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
#lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp,lstm_cell_1_matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0
lstm_cell_1/MatMul_1MatMulzeros:output:0+lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/addAddV2lstm_cell_1/MatMul:product:0lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp+lstm_cell_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
lstm_cell_1/BiasAddBiasAddlstm_cell_1/add:z:0*lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :Þ
lstm_cell_1/splitSplit$lstm_cell_1/split/split_dim:output:0lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitm
lstm_cell_1/SigmoidSigmoidlstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_1Sigmoidlstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
lstm_cell_1/mulMullstm_cell_1/Sigmoid_1:y:0zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_2Sigmoidlstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/mul_1Mullstm_cell_1/Sigmoid:y:0lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
lstm_cell_1/add_1AddV2lstm_cell_1/mul:z:0lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_3Sigmoidlstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
lstm_cell_1/Sigmoid_4Sigmoidlstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/mul_2Mullstm_cell_1/Sigmoid_3:y:0lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ÿ
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0*lstm_cell_1_matmul_readvariableop_resource,lstm_cell_1_matmul_1_readvariableop_resource+lstm_cell_1_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_8467*
condR
while_cond_8466*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ã
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ½
NoOpNoOp#^lstm_cell_1/BiasAdd/ReadVariableOp"^lstm_cell_1/MatMul/ReadVariableOp$^lstm_cell_1/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:ÿÿÿÿÿÿÿÿÿ: : : 2H
"lstm_cell_1/BiasAdd/ReadVariableOp"lstm_cell_1/BiasAdd/ReadVariableOp2F
!lstm_cell_1/MatMul/ReadVariableOp!lstm_cell_1/MatMul/ReadVariableOp2J
#lstm_cell_1/MatMul_1/ReadVariableOp#lstm_cell_1/MatMul_1/ReadVariableOp2
whilewhile:T P
,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ç6
µ
while_body_9642
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0C
0while_lstm_cell_matmul_readvariableop_resource_0:	ØF
2while_lstm_cell_matmul_1_readvariableop_resource_0:
Ø@
1while_lstm_cell_biasadd_readvariableop_resource_0:	Ø
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorA
.while_lstm_cell_matmul_readvariableop_resource:	ØD
0while_lstm_cell_matmul_1_readvariableop_resource:
Ø>
/while_lstm_cell_biasadd_readvariableop_resource:	Ø¢&while/lstm_cell/BiasAdd/ReadVariableOp¢%while/lstm_cell/MatMul/ReadVariableOp¢'while/lstm_cell/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
%while/lstm_cell/MatMul/ReadVariableOpReadVariableOp0while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	Ø*
dtype0´
while/lstm_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0-while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
'while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp2while_lstm_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
Ø*
dtype0
while/lstm_cell/MatMul_1MatMulwhile_placeholder_2/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
while/lstm_cell/addAddV2 while/lstm_cell/MatMul:product:0"while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
&while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp1while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:Ø*
dtype0
while/lstm_cell/BiasAddBiasAddwhile/lstm_cell/add:z:0.while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØa
while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ê
while/lstm_cell/splitSplit(while/lstm_cell/split/split_dim:output:0 while/lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitu
while/lstm_cell/SigmoidSigmoidwhile/lstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/lstm_cell/Sigmoid_1Sigmoidwhile/lstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mulMulwhile/lstm_cell/Sigmoid_1:y:0while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
while/lstm_cell/ReluReluwhile/lstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mul_1Mulwhile/lstm_cell/Sigmoid:y:0"while/lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/add_1AddV2while/lstm_cell/mul:z:0while/lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/lstm_cell/Sigmoid_2Sigmoidwhile/lstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
while/lstm_cell/Relu_1Reluwhile/lstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mul_2Mulwhile/lstm_cell/Sigmoid_2:y:0$while/lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÂ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒw
while/Identity_4Identitywhile/lstm_cell/mul_2:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/Identity_5Identitywhile/lstm_cell/add_1:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÇ

while/NoOpNoOp'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"d
/while_lstm_cell_biasadd_readvariableop_resource1while_lstm_cell_biasadd_readvariableop_resource_0"f
0while_lstm_cell_matmul_1_readvariableop_resource2while_lstm_cell_matmul_1_readvariableop_resource_0"b
.while_lstm_cell_matmul_readvariableop_resource0while_lstm_cell_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2P
&while/lstm_cell/BiasAdd/ReadVariableOp&while/lstm_cell/BiasAdd/ReadVariableOp2N
%while/lstm_cell/MatMul/ReadVariableOp%while/lstm_cell/MatMul/ReadVariableOp2R
'while/lstm_cell/MatMul_1/ReadVariableOp'while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
Ð"
Ò
while_body_7766
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0,
while_lstm_cell_1_7790_0:
,
while_lstm_cell_1_7792_0:
'
while_lstm_cell_1_7794_0:	
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor*
while_lstm_cell_1_7790:
*
while_lstm_cell_1_7792:
%
while_lstm_cell_1_7794:	¢)while/lstm_cell_1/StatefulPartitionedCall
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   §
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0¬
)while/lstm_cell_1/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_placeholder_3while_lstm_cell_1_7790_0while_lstm_cell_1_7792_0while_lstm_cell_1_7794_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *P
_output_shapes>
<:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_lstm_cell_1_layer_call_and_return_conditional_losses_7752Û
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder2while/lstm_cell_1/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒ
while/Identity_4Identity2while/lstm_cell_1/StatefulPartitionedCall:output:1^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/Identity_5Identity2while/lstm_cell_1/StatefulPartitionedCall:output:2^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿx

while/NoOpNoOp*^while/lstm_cell_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"2
while_lstm_cell_1_7790while_lstm_cell_1_7790_0"2
while_lstm_cell_1_7792while_lstm_cell_1_7792_0"2
while_lstm_cell_1_7794while_lstm_cell_1_7794_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2V
)while/lstm_cell_1/StatefulPartitionedCall)while/lstm_cell_1/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 

·
&__inference_lstm_1_layer_call_fn_10204
inputs_0
unknown:

	unknown_0:

	unknown_1:	
identity¢StatefulPartitionedCallè
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_lstm_1_layer_call_and_return_conditional_losses_8026p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:_ [
5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0
Æ	
ñ
?__inference_dense_layer_call_and_return_conditional_losses_8359

inputs1
matmul_readvariableop_resource:	-
biasadd_readvariableop_resource:
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
´
¾
while_cond_10427
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_13
/while_while_cond_10427___redundant_placeholder03
/while_while_cond_10427___redundant_placeholder13
/while_while_cond_10427___redundant_placeholder23
/while_while_cond_10427___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
¿

%__inference_dense_layer_call_fn_10807

inputs
unknown:	
	unknown_0:
identity¢StatefulPartitionedCall×
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *H
fCRA
?__inference_dense_layer_call_and_return_conditional_losses_8359o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
»	

lstm_while_cond_8989&
"lstm_while_lstm_while_loop_counter,
(lstm_while_lstm_while_maximum_iterations
lstm_while_placeholder
lstm_while_placeholder_1
lstm_while_placeholder_2
lstm_while_placeholder_3(
$lstm_while_less_lstm_strided_slice_1<
8lstm_while_lstm_while_cond_8989___redundant_placeholder0<
8lstm_while_lstm_while_cond_8989___redundant_placeholder1<
8lstm_while_lstm_while_cond_8989___redundant_placeholder2<
8lstm_while_lstm_while_cond_8989___redundant_placeholder3
lstm_while_identity
v
lstm/while/LessLesslstm_while_placeholder$lstm_while_less_lstm_strided_slice_1*
T0*
_output_shapes
: U
lstm/while/IdentityIdentitylstm/while/Less:z:0*
T0
*
_output_shapes
: "3
lstm_while_identitylstm/while/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
ö7
Ê
while_body_10428
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0F
2while_lstm_cell_1_matmul_readvariableop_resource_0:
H
4while_lstm_cell_1_matmul_1_readvariableop_resource_0:
B
3while_lstm_cell_1_biasadd_readvariableop_resource_0:	
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorD
0while_lstm_cell_1_matmul_readvariableop_resource:
F
2while_lstm_cell_1_matmul_1_readvariableop_resource:
@
1while_lstm_cell_1_biasadd_readvariableop_resource:	¢(while/lstm_cell_1/BiasAdd/ReadVariableOp¢'while/lstm_cell_1/MatMul/ReadVariableOp¢)while/lstm_cell_1/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   §
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
'while/lstm_cell_1/MatMul/ReadVariableOpReadVariableOp2while_lstm_cell_1_matmul_readvariableop_resource_0* 
_output_shapes
:
*
dtype0¸
while/lstm_cell_1/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0/while/lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
)while/lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp4while_lstm_cell_1_matmul_1_readvariableop_resource_0* 
_output_shapes
:
*
dtype0
while/lstm_cell_1/MatMul_1MatMulwhile_placeholder_21while/lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/addAddV2"while/lstm_cell_1/MatMul:product:0$while/lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
(while/lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp3while_lstm_cell_1_biasadd_readvariableop_resource_0*
_output_shapes	
:*
dtype0¤
while/lstm_cell_1/BiasAddBiasAddwhile/lstm_cell_1/add:z:00while/lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
!while/lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ð
while/lstm_cell_1/splitSplit*while/lstm_cell_1/split/split_dim:output:0"while/lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splity
while/lstm_cell_1/SigmoidSigmoid while/lstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_1Sigmoid while/lstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mulMulwhile/lstm_cell_1/Sigmoid_1:y:0while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_2Sigmoid while/lstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mul_1Mulwhile/lstm_cell_1/Sigmoid:y:0while/lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/add_1AddV2while/lstm_cell_1/mul:z:0while/lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_3Sigmoid while/lstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
while/lstm_cell_1/Sigmoid_4Sigmoidwhile/lstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mul_2Mulwhile/lstm_cell_1/Sigmoid_3:y:0while/lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÄ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell_1/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒy
while/Identity_4Identitywhile/lstm_cell_1/mul_2:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
while/Identity_5Identitywhile/lstm_cell_1/add_1:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÍ

while/NoOpNoOp)^while/lstm_cell_1/BiasAdd/ReadVariableOp(^while/lstm_cell_1/MatMul/ReadVariableOp*^while/lstm_cell_1/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"h
1while_lstm_cell_1_biasadd_readvariableop_resource3while_lstm_cell_1_biasadd_readvariableop_resource_0"j
2while_lstm_cell_1_matmul_1_readvariableop_resource4while_lstm_cell_1_matmul_1_readvariableop_resource_0"f
0while_lstm_cell_1_matmul_readvariableop_resource2while_lstm_cell_1_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2T
(while/lstm_cell_1/BiasAdd/ReadVariableOp(while/lstm_cell_1/BiasAdd/ReadVariableOp2R
'while/lstm_cell_1/MatMul/ReadVariableOp'while/lstm_cell_1/MatMul/ReadVariableOp2V
)while/lstm_cell_1/MatMul_1/ReadVariableOp)while/lstm_cell_1/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
î

E__inference_lstm_cell_1_layer_call_and_return_conditional_losses_7898

inputs

states
states_12
matmul_readvariableop_resource:
4
 matmul_1_readvariableop_resource:
.
biasadd_readvariableop_resource:	
identity

identity_1

identity_2¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp¢MatMul_1/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿz
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0n
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿe
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0n
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿQ
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :º
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitU
SigmoidSigmoidsplit:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_1Sigmoidsplit:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
mulMulSigmoid_1:y:0states_1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_2Sigmoidsplit:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
mul_1MulSigmoid:y:0Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿU
add_1AddV2mul:z:0	mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_3Sigmoidsplit:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿR
	Sigmoid_4Sigmoid	add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
mul_2MulSigmoid_3:y:0Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
IdentityIdentity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_1Identity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_2Identity	add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:PL
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_namestates:PL
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_namestates
×	
Æ
)__inference_sequential_layer_call_fn_8931

inputs
unknown:	Ø
	unknown_0:
Ø
	unknown_1:	Ø
	unknown_2:

	unknown_3:

	unknown_4:	
	unknown_5:	
	unknown_6:
identity¢StatefulPartitionedCallª
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_sequential_layer_call_and_return_conditional_losses_8795o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿ: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ç	
ò
@__inference_dense_layer_call_and_return_conditional_losses_10817

inputs1
matmul_readvariableop_resource:	-
biasadd_readvariableop_resource:
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
J

@__inference_lstm_1_layer_call_and_return_conditional_losses_8341

inputs>
*lstm_cell_1_matmul_readvariableop_resource:
@
,lstm_cell_1_matmul_1_readvariableop_resource:
:
+lstm_cell_1_biasadd_readvariableop_resource:	
identity¢"lstm_cell_1/BiasAdd/ReadVariableOp¢!lstm_cell_1/MatMul/ReadVariableOp¢#lstm_cell_1/MatMul_1/ReadVariableOp¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          n
	transpose	Transposeinputstranspose/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ê
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
!lstm_cell_1/MatMul/ReadVariableOpReadVariableOp*lstm_cell_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
lstm_cell_1/MatMulMatMulstrided_slice_2:output:0)lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
#lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp,lstm_cell_1_matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0
lstm_cell_1/MatMul_1MatMulzeros:output:0+lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/addAddV2lstm_cell_1/MatMul:product:0lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp+lstm_cell_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
lstm_cell_1/BiasAddBiasAddlstm_cell_1/add:z:0*lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :Þ
lstm_cell_1/splitSplit$lstm_cell_1/split/split_dim:output:0lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitm
lstm_cell_1/SigmoidSigmoidlstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_1Sigmoidlstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
lstm_cell_1/mulMullstm_cell_1/Sigmoid_1:y:0zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_2Sigmoidlstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/mul_1Mullstm_cell_1/Sigmoid:y:0lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
lstm_cell_1/add_1AddV2lstm_cell_1/mul:z:0lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_3Sigmoidlstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
lstm_cell_1/Sigmoid_4Sigmoidlstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/mul_2Mullstm_cell_1/Sigmoid_3:y:0lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ÿ
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0*lstm_cell_1_matmul_readvariableop_resource,lstm_cell_1_matmul_1_readvariableop_resource+lstm_cell_1_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_8257*
condR
while_cond_8256*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ã
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ½
NoOpNoOp#^lstm_cell_1/BiasAdd/ReadVariableOp"^lstm_cell_1/MatMul/ReadVariableOp$^lstm_cell_1/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:ÿÿÿÿÿÿÿÿÿ: : : 2H
"lstm_cell_1/BiasAdd/ReadVariableOp"lstm_cell_1/BiasAdd/ReadVariableOp2F
!lstm_cell_1/MatMul/ReadVariableOp!lstm_cell_1/MatMul/ReadVariableOp2J
#lstm_cell_1/MatMul_1/ReadVariableOp#lstm_cell_1/MatMul_1/ReadVariableOp2
whilewhile:T P
,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
õ
Ó
D__inference_sequential_layer_call_and_return_conditional_losses_8795

inputs
	lstm_8774:	Ø
	lstm_8776:
Ø
	lstm_8778:	Ø
lstm_1_8782:

lstm_1_8784:

lstm_1_8786:	

dense_8789:	

dense_8791:
identity¢dense/StatefulPartitionedCall¢dropout/StatefulPartitionedCall¢lstm/StatefulPartitionedCall¢lstm_1/StatefulPartitionedCallï
lstm/StatefulPartitionedCallStatefulPartitionedCallinputs	lstm_8774	lstm_8776	lstm_8778*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *G
fBR@
>__inference_lstm_layer_call_and_return_conditional_losses_8739ë
dropout/StatefulPartitionedCallStatefulPartitionedCall%lstm/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_8580
lstm_1/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0lstm_1_8782lstm_1_8784lstm_1_8786*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_lstm_1_layer_call_and_return_conditional_losses_8551
dense/StatefulPartitionedCallStatefulPartitionedCall'lstm_1/StatefulPartitionedCall:output:0
dense_8789
dense_8791*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *H
fCRA
?__inference_dense_layer_call_and_return_conditional_losses_8359u
IdentityIdentity&dense/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÈ
NoOpNoOp^dense/StatefulPartitionedCall ^dropout/StatefulPartitionedCall^lstm/StatefulPartitionedCall^lstm_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿ: : : : : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2<
lstm/StatefulPartitionedCalllstm/StatefulPartitionedCall2@
lstm_1/StatefulPartitionedCalllstm_1/StatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ó	
Å
lstm_1_while_cond_9425*
&lstm_1_while_lstm_1_while_loop_counter0
,lstm_1_while_lstm_1_while_maximum_iterations
lstm_1_while_placeholder
lstm_1_while_placeholder_1
lstm_1_while_placeholder_2
lstm_1_while_placeholder_3,
(lstm_1_while_less_lstm_1_strided_slice_1@
<lstm_1_while_lstm_1_while_cond_9425___redundant_placeholder0@
<lstm_1_while_lstm_1_while_cond_9425___redundant_placeholder1@
<lstm_1_while_lstm_1_while_cond_9425___redundant_placeholder2@
<lstm_1_while_lstm_1_while_cond_9425___redundant_placeholder3
lstm_1_while_identity
~
lstm_1/while/LessLesslstm_1_while_placeholder(lstm_1_while_less_lstm_1_strided_slice_1*
T0*
_output_shapes
: Y
lstm_1/while/IdentityIdentitylstm_1/while/Less:z:0*
T0
*
_output_shapes
: "7
lstm_1_while_identitylstm_1/while/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
ã	
Ê
)__inference_sequential_layer_call_fn_8385

lstm_input
unknown:	Ø
	unknown_0:
Ø
	unknown_1:	Ø
	unknown_2:

	unknown_3:

	unknown_4:	
	unknown_5:	
	unknown_6:
identity¢StatefulPartitionedCall®
StatefulPartitionedCallStatefulPartitionedCall
lstm_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_sequential_layer_call_and_return_conditional_losses_8366o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿ: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
$
_user_specified_name
lstm_input
¦
¿
D__inference_sequential_layer_call_and_return_conditional_losses_9220

inputs@
-lstm_lstm_cell_matmul_readvariableop_resource:	ØC
/lstm_lstm_cell_matmul_1_readvariableop_resource:
Ø=
.lstm_lstm_cell_biasadd_readvariableop_resource:	ØE
1lstm_1_lstm_cell_1_matmul_readvariableop_resource:
G
3lstm_1_lstm_cell_1_matmul_1_readvariableop_resource:
A
2lstm_1_lstm_cell_1_biasadd_readvariableop_resource:	7
$dense_matmul_readvariableop_resource:	3
%dense_biasadd_readvariableop_resource:
identity¢dense/BiasAdd/ReadVariableOp¢dense/MatMul/ReadVariableOp¢%lstm/lstm_cell/BiasAdd/ReadVariableOp¢$lstm/lstm_cell/MatMul/ReadVariableOp¢&lstm/lstm_cell/MatMul_1/ReadVariableOp¢
lstm/while¢)lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp¢(lstm_1/lstm_cell_1/MatMul/ReadVariableOp¢*lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp¢lstm_1/while@

lstm/ShapeShapeinputs*
T0*
_output_shapes
:b
lstm/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: d
lstm/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:d
lstm/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ê
lstm/strided_sliceStridedSlicelstm/Shape:output:0!lstm/strided_slice/stack:output:0#lstm/strided_slice/stack_1:output:0#lstm/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskV
lstm/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :
lstm/zeros/packedPacklstm/strided_slice:output:0lstm/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:U
lstm/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    |

lstm/zerosFilllstm/zeros/packed:output:0lstm/zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿX
lstm/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :
lstm/zeros_1/packedPacklstm/strided_slice:output:0lstm/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:W
lstm/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
lstm/zeros_1Filllstm/zeros_1/packed:output:0lstm/zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿh
lstm/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          w
lstm/transpose	Transposeinputslstm/transpose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿN
lstm/Shape_1Shapelstm/transpose:y:0*
T0*
_output_shapes
:d
lstm/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: f
lstm/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:f
lstm/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ô
lstm/strided_slice_1StridedSlicelstm/Shape_1:output:0#lstm/strided_slice_1/stack:output:0%lstm/strided_slice_1/stack_1:output:0%lstm/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskk
 lstm/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿÃ
lstm/TensorArrayV2TensorListReserve)lstm/TensorArrayV2/element_shape:output:0lstm/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
:lstm/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ï
,lstm/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorlstm/transpose:y:0Clstm/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒd
lstm/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: f
lstm/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:f
lstm/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
lstm/strided_slice_2StridedSlicelstm/transpose:y:0#lstm/strided_slice_2/stack:output:0%lstm/strided_slice_2/stack_1:output:0%lstm/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
$lstm/lstm_cell/MatMul/ReadVariableOpReadVariableOp-lstm_lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0
lstm/lstm_cell/MatMulMatMullstm/strided_slice_2:output:0,lstm/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
&lstm/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp/lstm_lstm_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0
lstm/lstm_cell/MatMul_1MatMullstm/zeros:output:0.lstm/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
lstm/lstm_cell/addAddV2lstm/lstm_cell/MatMul:product:0!lstm/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
%lstm/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp.lstm_lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0
lstm/lstm_cell/BiasAddBiasAddlstm/lstm_cell/add:z:0-lstm/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ`
lstm/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ç
lstm/lstm_cell/splitSplit'lstm/lstm_cell/split/split_dim:output:0lstm/lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splits
lstm/lstm_cell/SigmoidSigmoidlstm/lstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿu
lstm/lstm_cell/Sigmoid_1Sigmoidlstm/lstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/lstm_cell/mulMullstm/lstm_cell/Sigmoid_1:y:0lstm/zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿm
lstm/lstm_cell/ReluRelulstm/lstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/lstm_cell/mul_1Mullstm/lstm_cell/Sigmoid:y:0!lstm/lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/lstm_cell/add_1AddV2lstm/lstm_cell/mul:z:0lstm/lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿu
lstm/lstm_cell/Sigmoid_2Sigmoidlstm/lstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
lstm/lstm_cell/Relu_1Relulstm/lstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/lstm_cell/mul_2Mullstm/lstm_cell/Sigmoid_2:y:0#lstm/lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
"lstm/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ç
lstm/TensorArrayV2_1TensorListReserve+lstm/TensorArrayV2_1/element_shape:output:0lstm/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒK
	lstm/timeConst*
_output_shapes
: *
dtype0*
value	B : h
lstm/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿY
lstm/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ¿

lstm/whileWhile lstm/while/loop_counter:output:0&lstm/while/maximum_iterations:output:0lstm/time:output:0lstm/TensorArrayV2_1:handle:0lstm/zeros:output:0lstm/zeros_1:output:0lstm/strided_slice_1:output:0<lstm/TensorArrayUnstack/TensorListFromTensor:output_handle:0-lstm_lstm_cell_matmul_readvariableop_resource/lstm_lstm_cell_matmul_1_readvariableop_resource.lstm_lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( * 
bodyR
lstm_while_body_8990* 
condR
lstm_while_cond_8989*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
5lstm/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ò
'lstm/TensorArrayV2Stack/TensorListStackTensorListStacklstm/while:output:3>lstm/TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0m
lstm/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿf
lstm/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: f
lstm/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¡
lstm/strided_slice_3StridedSlice0lstm/TensorArrayV2Stack/TensorListStack:tensor:0#lstm/strided_slice_3/stack:output:0%lstm/strided_slice_3/stack_1:output:0%lstm/strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maskj
lstm/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ¦
lstm/transpose_1	Transpose0lstm/TensorArrayV2Stack/TensorListStack:tensor:0lstm/transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
lstm/runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    i
dropout/IdentityIdentitylstm/transpose_1:y:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿU
lstm_1/ShapeShapedropout/Identity:output:0*
T0*
_output_shapes
:d
lstm_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: f
lstm_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:f
lstm_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ô
lstm_1/strided_sliceStridedSlicelstm_1/Shape:output:0#lstm_1/strided_slice/stack:output:0%lstm_1/strided_slice/stack_1:output:0%lstm_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskX
lstm_1/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :
lstm_1/zeros/packedPacklstm_1/strided_slice:output:0lstm_1/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:W
lstm_1/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
lstm_1/zerosFilllstm_1/zeros/packed:output:0lstm_1/zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
lstm_1/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :
lstm_1/zeros_1/packedPacklstm_1/strided_slice:output:0 lstm_1/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:Y
lstm_1/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
lstm_1/zeros_1Filllstm_1/zeros_1/packed:output:0lstm_1/zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
lstm_1/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          
lstm_1/transpose	Transposedropout/Identity:output:0lstm_1/transpose/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿR
lstm_1/Shape_1Shapelstm_1/transpose:y:0*
T0*
_output_shapes
:f
lstm_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: h
lstm_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:h
lstm_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:þ
lstm_1/strided_slice_1StridedSlicelstm_1/Shape_1:output:0%lstm_1/strided_slice_1/stack:output:0'lstm_1/strided_slice_1/stack_1:output:0'lstm_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskm
"lstm_1/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿÉ
lstm_1/TensorArrayV2TensorListReserve+lstm_1/TensorArrayV2/element_shape:output:0lstm_1/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
<lstm_1/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   õ
.lstm_1/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorlstm_1/transpose:y:0Elstm_1/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒf
lstm_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: h
lstm_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:h
lstm_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
lstm_1/strided_slice_2StridedSlicelstm_1/transpose:y:0%lstm_1/strided_slice_2/stack:output:0'lstm_1/strided_slice_2/stack_1:output:0'lstm_1/strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
(lstm_1/lstm_cell_1/MatMul/ReadVariableOpReadVariableOp1lstm_1_lstm_cell_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0©
lstm_1/lstm_cell_1/MatMulMatMullstm_1/strided_slice_2:output:00lstm_1/lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
*lstm_1/lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp3lstm_1_lstm_cell_1_matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0£
lstm_1/lstm_cell_1/MatMul_1MatMullstm_1/zeros:output:02lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/lstm_cell_1/addAddV2#lstm_1/lstm_cell_1/MatMul:product:0%lstm_1/lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
)lstm_1/lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp2lstm_1_lstm_cell_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0§
lstm_1/lstm_cell_1/BiasAddBiasAddlstm_1/lstm_cell_1/add:z:01lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
"lstm_1/lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ó
lstm_1/lstm_cell_1/splitSplit+lstm_1/lstm_cell_1/split/split_dim:output:0#lstm_1/lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_split{
lstm_1/lstm_cell_1/SigmoidSigmoid!lstm_1/lstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ}
lstm_1/lstm_cell_1/Sigmoid_1Sigmoid!lstm_1/lstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/lstm_cell_1/mulMul lstm_1/lstm_cell_1/Sigmoid_1:y:0lstm_1/zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ}
lstm_1/lstm_cell_1/Sigmoid_2Sigmoid!lstm_1/lstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/lstm_cell_1/mul_1Mullstm_1/lstm_cell_1/Sigmoid:y:0 lstm_1/lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/lstm_cell_1/add_1AddV2lstm_1/lstm_cell_1/mul:z:0lstm_1/lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ}
lstm_1/lstm_cell_1/Sigmoid_3Sigmoid!lstm_1/lstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿx
lstm_1/lstm_cell_1/Sigmoid_4Sigmoidlstm_1/lstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/lstm_cell_1/mul_2Mul lstm_1/lstm_cell_1/Sigmoid_3:y:0 lstm_1/lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿu
$lstm_1/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Í
lstm_1/TensorArrayV2_1TensorListReserve-lstm_1/TensorArrayV2_1/element_shape:output:0lstm_1/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒM
lstm_1/timeConst*
_output_shapes
: *
dtype0*
value	B : j
lstm_1/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ[
lstm_1/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : á
lstm_1/whileWhile"lstm_1/while/loop_counter:output:0(lstm_1/while/maximum_iterations:output:0lstm_1/time:output:0lstm_1/TensorArrayV2_1:handle:0lstm_1/zeros:output:0lstm_1/zeros_1:output:0lstm_1/strided_slice_1:output:0>lstm_1/TensorArrayUnstack/TensorListFromTensor:output_handle:01lstm_1_lstm_cell_1_matmul_readvariableop_resource3lstm_1_lstm_cell_1_matmul_1_readvariableop_resource2lstm_1_lstm_cell_1_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *"
bodyR
lstm_1_while_body_9130*"
condR
lstm_1_while_cond_9129*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
7lstm_1/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ø
)lstm_1/TensorArrayV2Stack/TensorListStackTensorListStacklstm_1/while:output:3@lstm_1/TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0o
lstm_1/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿh
lstm_1/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: h
lstm_1/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:«
lstm_1/strided_slice_3StridedSlice2lstm_1/TensorArrayV2Stack/TensorListStack:tensor:0%lstm_1/strided_slice_3/stack:output:0'lstm_1/strided_slice_3/stack_1:output:0'lstm_1/strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maskl
lstm_1/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ¬
lstm_1/transpose_1	Transpose2lstm_1/TensorArrayV2Stack/TensorListStack:tensor:0 lstm_1/transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿb
lstm_1/runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
dense/MatMulMatMullstm_1/strided_slice_3:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿe
IdentityIdentitydense/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp&^lstm/lstm_cell/BiasAdd/ReadVariableOp%^lstm/lstm_cell/MatMul/ReadVariableOp'^lstm/lstm_cell/MatMul_1/ReadVariableOp^lstm/while*^lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp)^lstm_1/lstm_cell_1/MatMul/ReadVariableOp+^lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp^lstm_1/while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿ: : : : : : : : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2N
%lstm/lstm_cell/BiasAdd/ReadVariableOp%lstm/lstm_cell/BiasAdd/ReadVariableOp2L
$lstm/lstm_cell/MatMul/ReadVariableOp$lstm/lstm_cell/MatMul/ReadVariableOp2P
&lstm/lstm_cell/MatMul_1/ReadVariableOp&lstm/lstm_cell/MatMul_1/ReadVariableOp2

lstm/while
lstm/while2V
)lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp)lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp2T
(lstm_1/lstm_cell_1/MatMul/ReadVariableOp(lstm_1/lstm_cell_1/MatMul/ReadVariableOp2X
*lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp*lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp2
lstm_1/whilelstm_1/while:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¥
³
#__inference_lstm_layer_call_fn_9561
inputs_0
unknown:	Ø
	unknown_0:
Ø
	unknown_1:	Ø
identity¢StatefulPartitionedCalló
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *G
fBR@
>__inference_lstm_layer_call_and_return_conditional_losses_7676}
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0
I

?__inference_lstm_layer_call_and_return_conditional_losses_10012

inputs;
(lstm_cell_matmul_readvariableop_resource:	Ø>
*lstm_cell_matmul_1_readvariableop_resource:
Ø8
)lstm_cell_biasadd_readvariableop_resource:	Ø
identity¢ lstm_cell/BiasAdd/ReadVariableOp¢lstm_cell/MatMul/ReadVariableOp¢!lstm_cell/MatMul_1/ReadVariableOp¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          m
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
lstm_cell/MatMul/ReadVariableOpReadVariableOp(lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0
lstm_cell/MatMulMatMulstrided_slice_2:output:0'lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
!lstm_cell/MatMul_1/ReadVariableOpReadVariableOp*lstm_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0
lstm_cell/MatMul_1MatMulzeros:output:0)lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
lstm_cell/addAddV2lstm_cell/MatMul:product:0lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
 lstm_cell/BiasAdd/ReadVariableOpReadVariableOp)lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0
lstm_cell/BiasAddBiasAddlstm_cell/add:z:0(lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ[
lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :Ø
lstm_cell/splitSplit"lstm_cell/split/split_dim:output:0lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_spliti
lstm_cell/SigmoidSigmoidlstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
lstm_cell/Sigmoid_1Sigmoidlstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
lstm_cell/mulMullstm_cell/Sigmoid_1:y:0zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
lstm_cell/ReluRelulstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
lstm_cell/mul_1Mullstm_cell/Sigmoid:y:0lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
lstm_cell/add_1AddV2lstm_cell/mul:z:0lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
lstm_cell/Sigmoid_2Sigmoidlstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
lstm_cell/Relu_1Relulstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell/mul_2Mullstm_cell/Sigmoid_2:y:0lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ù
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0(lstm_cell_matmul_readvariableop_resource*lstm_cell_matmul_1_readvariableop_resource)lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_9928*
condR
while_cond_9927*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ã
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    c
IdentityIdentitytranspose_1:y:0^NoOp*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ·
NoOpNoOp!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : 2D
 lstm_cell/BiasAdd/ReadVariableOp lstm_cell/BiasAdd/ReadVariableOp2B
lstm_cell/MatMul/ReadVariableOplstm_cell/MatMul/ReadVariableOp2F
!lstm_cell/MatMul_1/ReadVariableOp!lstm_cell/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
û
±
#__inference_lstm_layer_call_fn_9583

inputs
unknown:	Ø
	unknown_0:
Ø
	unknown_1:	Ø
identity¢StatefulPartitionedCallè
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *G
fBR@
>__inference_lstm_layer_call_and_return_conditional_losses_8739t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
û
±
#__inference_lstm_layer_call_fn_9572

inputs
unknown:	Ø
	unknown_0:
Ø
	unknown_1:	Ø
identity¢StatefulPartitionedCallè
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *G
fBR@
>__inference_lstm_layer_call_and_return_conditional_losses_8184t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ç6
µ
while_body_9928
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0C
0while_lstm_cell_matmul_readvariableop_resource_0:	ØF
2while_lstm_cell_matmul_1_readvariableop_resource_0:
Ø@
1while_lstm_cell_biasadd_readvariableop_resource_0:	Ø
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorA
.while_lstm_cell_matmul_readvariableop_resource:	ØD
0while_lstm_cell_matmul_1_readvariableop_resource:
Ø>
/while_lstm_cell_biasadd_readvariableop_resource:	Ø¢&while/lstm_cell/BiasAdd/ReadVariableOp¢%while/lstm_cell/MatMul/ReadVariableOp¢'while/lstm_cell/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
%while/lstm_cell/MatMul/ReadVariableOpReadVariableOp0while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	Ø*
dtype0´
while/lstm_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0-while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
'while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp2while_lstm_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
Ø*
dtype0
while/lstm_cell/MatMul_1MatMulwhile_placeholder_2/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
while/lstm_cell/addAddV2 while/lstm_cell/MatMul:product:0"while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
&while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp1while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:Ø*
dtype0
while/lstm_cell/BiasAddBiasAddwhile/lstm_cell/add:z:0.while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØa
while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ê
while/lstm_cell/splitSplit(while/lstm_cell/split/split_dim:output:0 while/lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitu
while/lstm_cell/SigmoidSigmoidwhile/lstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/lstm_cell/Sigmoid_1Sigmoidwhile/lstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mulMulwhile/lstm_cell/Sigmoid_1:y:0while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
while/lstm_cell/ReluReluwhile/lstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mul_1Mulwhile/lstm_cell/Sigmoid:y:0"while/lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/add_1AddV2while/lstm_cell/mul:z:0while/lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/lstm_cell/Sigmoid_2Sigmoidwhile/lstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
while/lstm_cell/Relu_1Reluwhile/lstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mul_2Mulwhile/lstm_cell/Sigmoid_2:y:0$while/lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÂ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒw
while/Identity_4Identitywhile/lstm_cell/mul_2:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/Identity_5Identitywhile/lstm_cell/add_1:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÇ

while/NoOpNoOp'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"d
/while_lstm_cell_biasadd_readvariableop_resource1while_lstm_cell_biasadd_readvariableop_resource_0"f
0while_lstm_cell_matmul_1_readvariableop_resource2while_lstm_cell_matmul_1_readvariableop_resource_0"b
.while_lstm_cell_matmul_readvariableop_resource0while_lstm_cell_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2P
&while/lstm_cell/BiasAdd/ReadVariableOp&while/lstm_cell/BiasAdd/ReadVariableOp2N
%while/lstm_cell/MatMul/ReadVariableOp%while/lstm_cell/MatMul/ReadVariableOp2R
'while/lstm_cell/MatMul_1/ReadVariableOp'while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
û
µ
&__inference_lstm_1_layer_call_fn_10215

inputs
unknown:

	unknown_0:

	unknown_1:	
identity¢StatefulPartitionedCallæ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_lstm_1_layer_call_and_return_conditional_losses_8341p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:ÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¯
¹
while_cond_7956
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_7956___redundant_placeholder02
.while_while_cond_7956___redundant_placeholder12
.while_while_cond_7956___redundant_placeholder22
.while_while_cond_7956___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
ÖI
µ
sequential_lstm_while_body_7105<
8sequential_lstm_while_sequential_lstm_while_loop_counterB
>sequential_lstm_while_sequential_lstm_while_maximum_iterations%
!sequential_lstm_while_placeholder'
#sequential_lstm_while_placeholder_1'
#sequential_lstm_while_placeholder_2'
#sequential_lstm_while_placeholder_3;
7sequential_lstm_while_sequential_lstm_strided_slice_1_0w
ssequential_lstm_while_tensorarrayv2read_tensorlistgetitem_sequential_lstm_tensorarrayunstack_tensorlistfromtensor_0S
@sequential_lstm_while_lstm_cell_matmul_readvariableop_resource_0:	ØV
Bsequential_lstm_while_lstm_cell_matmul_1_readvariableop_resource_0:
ØP
Asequential_lstm_while_lstm_cell_biasadd_readvariableop_resource_0:	Ø"
sequential_lstm_while_identity$
 sequential_lstm_while_identity_1$
 sequential_lstm_while_identity_2$
 sequential_lstm_while_identity_3$
 sequential_lstm_while_identity_4$
 sequential_lstm_while_identity_59
5sequential_lstm_while_sequential_lstm_strided_slice_1u
qsequential_lstm_while_tensorarrayv2read_tensorlistgetitem_sequential_lstm_tensorarrayunstack_tensorlistfromtensorQ
>sequential_lstm_while_lstm_cell_matmul_readvariableop_resource:	ØT
@sequential_lstm_while_lstm_cell_matmul_1_readvariableop_resource:
ØN
?sequential_lstm_while_lstm_cell_biasadd_readvariableop_resource:	Ø¢6sequential/lstm/while/lstm_cell/BiasAdd/ReadVariableOp¢5sequential/lstm/while/lstm_cell/MatMul/ReadVariableOp¢7sequential/lstm/while/lstm_cell/MatMul_1/ReadVariableOp
Gsequential/lstm/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ö
9sequential/lstm/while/TensorArrayV2Read/TensorListGetItemTensorListGetItemssequential_lstm_while_tensorarrayv2read_tensorlistgetitem_sequential_lstm_tensorarrayunstack_tensorlistfromtensor_0!sequential_lstm_while_placeholderPsequential/lstm/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0·
5sequential/lstm/while/lstm_cell/MatMul/ReadVariableOpReadVariableOp@sequential_lstm_while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	Ø*
dtype0ä
&sequential/lstm/while/lstm_cell/MatMulMatMul@sequential/lstm/while/TensorArrayV2Read/TensorListGetItem:item:0=sequential/lstm/while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ¼
7sequential/lstm/while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOpBsequential_lstm_while_lstm_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
Ø*
dtype0Ë
(sequential/lstm/while/lstm_cell/MatMul_1MatMul#sequential_lstm_while_placeholder_2?sequential/lstm/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØÅ
#sequential/lstm/while/lstm_cell/addAddV20sequential/lstm/while/lstm_cell/MatMul:product:02sequential/lstm/while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØµ
6sequential/lstm/while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOpAsequential_lstm_while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:Ø*
dtype0Î
'sequential/lstm/while/lstm_cell/BiasAddBiasAdd'sequential/lstm/while/lstm_cell/add:z:0>sequential/lstm/while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØq
/sequential/lstm/while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :
%sequential/lstm/while/lstm_cell/splitSplit8sequential/lstm/while/lstm_cell/split/split_dim:output:00sequential/lstm/while/lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_split
'sequential/lstm/while/lstm_cell/SigmoidSigmoid.sequential/lstm/while/lstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
)sequential/lstm/while/lstm_cell/Sigmoid_1Sigmoid.sequential/lstm/while/lstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ±
#sequential/lstm/while/lstm_cell/mulMul-sequential/lstm/while/lstm_cell/Sigmoid_1:y:0#sequential_lstm_while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
$sequential/lstm/while/lstm_cell/ReluRelu.sequential/lstm/while/lstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÀ
%sequential/lstm/while/lstm_cell/mul_1Mul+sequential/lstm/while/lstm_cell/Sigmoid:y:02sequential/lstm/while/lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
%sequential/lstm/while/lstm_cell/add_1AddV2'sequential/lstm/while/lstm_cell/mul:z:0)sequential/lstm/while/lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
)sequential/lstm/while/lstm_cell/Sigmoid_2Sigmoid.sequential/lstm/while/lstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&sequential/lstm/while/lstm_cell/Relu_1Relu)sequential/lstm/while/lstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÄ
%sequential/lstm/while/lstm_cell/mul_2Mul-sequential/lstm/while/lstm_cell/Sigmoid_2:y:04sequential/lstm/while/lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
:sequential/lstm/while/TensorArrayV2Write/TensorListSetItemTensorListSetItem#sequential_lstm_while_placeholder_1!sequential_lstm_while_placeholder)sequential/lstm/while/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒ]
sequential/lstm/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :
sequential/lstm/while/addAddV2!sequential_lstm_while_placeholder$sequential/lstm/while/add/y:output:0*
T0*
_output_shapes
: _
sequential/lstm/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :§
sequential/lstm/while/add_1AddV28sequential_lstm_while_sequential_lstm_while_loop_counter&sequential/lstm/while/add_1/y:output:0*
T0*
_output_shapes
: 
sequential/lstm/while/IdentityIdentitysequential/lstm/while/add_1:z:0^sequential/lstm/while/NoOp*
T0*
_output_shapes
: ª
 sequential/lstm/while/Identity_1Identity>sequential_lstm_while_sequential_lstm_while_maximum_iterations^sequential/lstm/while/NoOp*
T0*
_output_shapes
: 
 sequential/lstm/while/Identity_2Identitysequential/lstm/while/add:z:0^sequential/lstm/while/NoOp*
T0*
_output_shapes
: É
 sequential/lstm/while/Identity_3IdentityJsequential/lstm/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^sequential/lstm/while/NoOp*
T0*
_output_shapes
: :éèÒ§
 sequential/lstm/while/Identity_4Identity)sequential/lstm/while/lstm_cell/mul_2:z:0^sequential/lstm/while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ§
 sequential/lstm/while/Identity_5Identity)sequential/lstm/while/lstm_cell/add_1:z:0^sequential/lstm/while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
sequential/lstm/while/NoOpNoOp7^sequential/lstm/while/lstm_cell/BiasAdd/ReadVariableOp6^sequential/lstm/while/lstm_cell/MatMul/ReadVariableOp8^sequential/lstm/while/lstm_cell/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "I
sequential_lstm_while_identity'sequential/lstm/while/Identity:output:0"M
 sequential_lstm_while_identity_1)sequential/lstm/while/Identity_1:output:0"M
 sequential_lstm_while_identity_2)sequential/lstm/while/Identity_2:output:0"M
 sequential_lstm_while_identity_3)sequential/lstm/while/Identity_3:output:0"M
 sequential_lstm_while_identity_4)sequential/lstm/while/Identity_4:output:0"M
 sequential_lstm_while_identity_5)sequential/lstm/while/Identity_5:output:0"
?sequential_lstm_while_lstm_cell_biasadd_readvariableop_resourceAsequential_lstm_while_lstm_cell_biasadd_readvariableop_resource_0"
@sequential_lstm_while_lstm_cell_matmul_1_readvariableop_resourceBsequential_lstm_while_lstm_cell_matmul_1_readvariableop_resource_0"
>sequential_lstm_while_lstm_cell_matmul_readvariableop_resource@sequential_lstm_while_lstm_cell_matmul_readvariableop_resource_0"p
5sequential_lstm_while_sequential_lstm_strided_slice_17sequential_lstm_while_sequential_lstm_strided_slice_1_0"è
qsequential_lstm_while_tensorarrayv2read_tensorlistgetitem_sequential_lstm_tensorarrayunstack_tensorlistfromtensorssequential_lstm_while_tensorarrayv2read_tensorlistgetitem_sequential_lstm_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2p
6sequential/lstm/while/lstm_cell/BiasAdd/ReadVariableOp6sequential/lstm/while/lstm_cell/BiasAdd/ReadVariableOp2n
5sequential/lstm/while/lstm_cell/MatMul/ReadVariableOp5sequential/lstm/while/lstm_cell/MatMul/ReadVariableOp2r
7sequential/lstm/while/lstm_cell/MatMul_1/ReadVariableOp7sequential/lstm/while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
¯
¹
while_cond_8654
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_8654___redundant_placeholder02
.while_while_cond_8654___redundant_placeholder12
.while_while_cond_8654___redundant_placeholder22
.while_while_cond_8654___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
ÁI

>__inference_lstm_layer_call_and_return_conditional_losses_9726
inputs_0;
(lstm_cell_matmul_readvariableop_resource:	Ø>
*lstm_cell_matmul_1_readvariableop_resource:
Ø8
)lstm_cell_biasadd_readvariableop_resource:	Ø
identity¢ lstm_cell/BiasAdd/ReadVariableOp¢lstm_cell/MatMul/ReadVariableOp¢!lstm_cell/MatMul_1/ReadVariableOp¢while=
ShapeShapeinputs_0*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          x
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
lstm_cell/MatMul/ReadVariableOpReadVariableOp(lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0
lstm_cell/MatMulMatMulstrided_slice_2:output:0'lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
!lstm_cell/MatMul_1/ReadVariableOpReadVariableOp*lstm_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0
lstm_cell/MatMul_1MatMulzeros:output:0)lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
lstm_cell/addAddV2lstm_cell/MatMul:product:0lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
 lstm_cell/BiasAdd/ReadVariableOpReadVariableOp)lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0
lstm_cell/BiasAddBiasAddlstm_cell/add:z:0(lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ[
lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :Ø
lstm_cell/splitSplit"lstm_cell/split/split_dim:output:0lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_spliti
lstm_cell/SigmoidSigmoidlstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
lstm_cell/Sigmoid_1Sigmoidlstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
lstm_cell/mulMullstm_cell/Sigmoid_1:y:0zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
lstm_cell/ReluRelulstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
lstm_cell/mul_1Mullstm_cell/Sigmoid:y:0lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
lstm_cell/add_1AddV2lstm_cell/mul:z:0lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
lstm_cell/Sigmoid_2Sigmoidlstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
lstm_cell/Relu_1Relulstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell/mul_2Mullstm_cell/Sigmoid_2:y:0lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ù
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0(lstm_cell_matmul_readvariableop_resource*lstm_cell_matmul_1_readvariableop_resource)lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_9642*
condR
while_cond_9641*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ì
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"           
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    l
IdentityIdentitytranspose_1:y:0^NoOp*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ·
NoOpNoOp!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : 2D
 lstm_cell/BiasAdd/ReadVariableOp lstm_cell/BiasAdd/ReadVariableOp2B
lstm_cell/MatMul/ReadVariableOplstm_cell/MatMul/ReadVariableOp2F
!lstm_cell/MatMul_1/ReadVariableOp!lstm_cell/MatMul_1/ReadVariableOp2
whilewhile:^ Z
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0
÷

F__inference_lstm_cell_1_layer_call_and_return_conditional_losses_10981

inputs
states_0
states_12
matmul_readvariableop_resource:
4
 matmul_1_readvariableop_resource:
.
biasadd_readvariableop_resource:	
identity

identity_1

identity_2¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp¢MatMul_1/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿz
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0p
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿe
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0n
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿQ
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :º
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitU
SigmoidSigmoidsplit:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_1Sigmoidsplit:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
mulMulSigmoid_1:y:0states_1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_2Sigmoidsplit:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
mul_1MulSigmoid:y:0Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿU
add_1AddV2mul:z:0	mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_3Sigmoidsplit:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿR
	Sigmoid_4Sigmoid	add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
mul_2MulSigmoid_3:y:0Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
IdentityIdentity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_1Identity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_2Identity	add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/0:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/1
ð
ó
)__inference_lstm_cell_layer_call_fn_10851

inputs
states_0
states_1
unknown:	Ø
	unknown_0:
Ø
	unknown_1:	Ø
identity

identity_1

identity_2¢StatefulPartitionedCall©
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0states_1unknown	unknown_0	unknown_1*
Tin

2*
Tout
2*
_collective_manager_ids
 *P
_output_shapes>
<:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_7548p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr

Identity_2Identity StatefulPartitionedCall:output:2^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*T
_input_shapesC
A:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/0:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/1
J

A__inference_lstm_1_layer_call_and_return_conditional_losses_10655

inputs>
*lstm_cell_1_matmul_readvariableop_resource:
@
,lstm_cell_1_matmul_1_readvariableop_resource:
:
+lstm_cell_1_biasadd_readvariableop_resource:	
identity¢"lstm_cell_1/BiasAdd/ReadVariableOp¢!lstm_cell_1/MatMul/ReadVariableOp¢#lstm_cell_1/MatMul_1/ReadVariableOp¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          n
	transpose	Transposeinputstranspose/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ê
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
!lstm_cell_1/MatMul/ReadVariableOpReadVariableOp*lstm_cell_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
lstm_cell_1/MatMulMatMulstrided_slice_2:output:0)lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
#lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp,lstm_cell_1_matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0
lstm_cell_1/MatMul_1MatMulzeros:output:0+lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/addAddV2lstm_cell_1/MatMul:product:0lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp+lstm_cell_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
lstm_cell_1/BiasAddBiasAddlstm_cell_1/add:z:0*lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :Þ
lstm_cell_1/splitSplit$lstm_cell_1/split/split_dim:output:0lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitm
lstm_cell_1/SigmoidSigmoidlstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_1Sigmoidlstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
lstm_cell_1/mulMullstm_cell_1/Sigmoid_1:y:0zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_2Sigmoidlstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/mul_1Mullstm_cell_1/Sigmoid:y:0lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
lstm_cell_1/add_1AddV2lstm_cell_1/mul:z:0lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_3Sigmoidlstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
lstm_cell_1/Sigmoid_4Sigmoidlstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/mul_2Mullstm_cell_1/Sigmoid_3:y:0lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0*lstm_cell_1_matmul_readvariableop_resource,lstm_cell_1_matmul_1_readvariableop_resource+lstm_cell_1_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_10571*
condR
while_cond_10570*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ã
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ½
NoOpNoOp#^lstm_cell_1/BiasAdd/ReadVariableOp"^lstm_cell_1/MatMul/ReadVariableOp$^lstm_cell_1/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:ÿÿÿÿÿÿÿÿÿ: : : 2H
"lstm_cell_1/BiasAdd/ReadVariableOp"lstm_cell_1/BiasAdd/ReadVariableOp2F
!lstm_cell_1/MatMul/ReadVariableOp!lstm_cell_1/MatMul/ReadVariableOp2J
#lstm_cell_1/MatMul_1/ReadVariableOp#lstm_cell_1/MatMul_1/ReadVariableOp2
whilewhile:T P
,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
I

>__inference_lstm_layer_call_and_return_conditional_losses_8184

inputs;
(lstm_cell_matmul_readvariableop_resource:	Ø>
*lstm_cell_matmul_1_readvariableop_resource:
Ø8
)lstm_cell_biasadd_readvariableop_resource:	Ø
identity¢ lstm_cell/BiasAdd/ReadVariableOp¢lstm_cell/MatMul/ReadVariableOp¢!lstm_cell/MatMul_1/ReadVariableOp¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          m
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
lstm_cell/MatMul/ReadVariableOpReadVariableOp(lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0
lstm_cell/MatMulMatMulstrided_slice_2:output:0'lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
!lstm_cell/MatMul_1/ReadVariableOpReadVariableOp*lstm_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0
lstm_cell/MatMul_1MatMulzeros:output:0)lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
lstm_cell/addAddV2lstm_cell/MatMul:product:0lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
 lstm_cell/BiasAdd/ReadVariableOpReadVariableOp)lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0
lstm_cell/BiasAddBiasAddlstm_cell/add:z:0(lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ[
lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :Ø
lstm_cell/splitSplit"lstm_cell/split/split_dim:output:0lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_spliti
lstm_cell/SigmoidSigmoidlstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
lstm_cell/Sigmoid_1Sigmoidlstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
lstm_cell/mulMullstm_cell/Sigmoid_1:y:0zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
lstm_cell/ReluRelulstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
lstm_cell/mul_1Mullstm_cell/Sigmoid:y:0lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
lstm_cell/add_1AddV2lstm_cell/mul:z:0lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
lstm_cell/Sigmoid_2Sigmoidlstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
lstm_cell/Relu_1Relulstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell/mul_2Mullstm_cell/Sigmoid_2:y:0lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ù
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0(lstm_cell_matmul_readvariableop_resource*lstm_cell_matmul_1_readvariableop_resource)lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_8100*
condR
while_cond_8099*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ã
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    c
IdentityIdentitytranspose_1:y:0^NoOp*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ·
NoOpNoOp!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : 2D
 lstm_cell/BiasAdd/ReadVariableOp lstm_cell/BiasAdd/ReadVariableOp2B
lstm_cell/MatMul/ReadVariableOplstm_cell/MatMul/ReadVariableOp2F
!lstm_cell/MatMul_1/ReadVariableOp!lstm_cell/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
÷

F__inference_lstm_cell_1_layer_call_and_return_conditional_losses_11013

inputs
states_0
states_12
matmul_readvariableop_resource:
4
 matmul_1_readvariableop_resource:
.
biasadd_readvariableop_resource:	
identity

identity_1

identity_2¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp¢MatMul_1/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿz
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0p
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿe
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0n
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿQ
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :º
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitU
SigmoidSigmoidsplit:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_1Sigmoidsplit:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
mulMulSigmoid_1:y:0states_1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_2Sigmoidsplit:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
mul_1MulSigmoid:y:0Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿU
add_1AddV2mul:z:0	mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_3Sigmoidsplit:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿR
	Sigmoid_4Sigmoid	add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
mul_2MulSigmoid_3:y:0Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
IdentityIdentity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_1Identity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_2Identity	add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/0:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/1
¯
¹
while_cond_7765
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_7765___redundant_placeholder02
.while_while_cond_7765___redundant_placeholder12
.while_while_cond_7765___redundant_placeholder22
.while_while_cond_7765___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
æ

C__inference_lstm_cell_layer_call_and_return_conditional_losses_7402

inputs

states
states_11
matmul_readvariableop_resource:	Ø4
 matmul_1_readvariableop_resource:
Ø.
biasadd_readvariableop_resource:	Ø
identity

identity_1

identity_2¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp¢MatMul_1/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØz
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0n
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØe
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0n
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØQ
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :º
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitU
SigmoidSigmoidsplit:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_1Sigmoidsplit:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
mulMulSigmoid_1:y:0states_1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿO
ReluRelusplit:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
mul_1MulSigmoid:y:0Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿU
add_1AddV2mul:z:0	mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_2Sigmoidsplit:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿL
Relu_1Relu	add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
mul_2MulSigmoid_2:y:0Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
IdentityIdentity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_1Identity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_2Identity	add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*T
_input_shapesC
A:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:PL
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_namestates:PL
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_namestates
î

E__inference_lstm_cell_1_layer_call_and_return_conditional_losses_7752

inputs

states
states_12
matmul_readvariableop_resource:
4
 matmul_1_readvariableop_resource:
.
biasadd_readvariableop_resource:	
identity

identity_1

identity_2¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp¢MatMul_1/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿz
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0n
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿe
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0n
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿQ
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :º
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitU
SigmoidSigmoidsplit:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_1Sigmoidsplit:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
mulMulSigmoid_1:y:0states_1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_2Sigmoidsplit:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
mul_1MulSigmoid:y:0Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿU
add_1AddV2mul:z:0	mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_3Sigmoidsplit:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿR
	Sigmoid_4Sigmoid	add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
mul_2MulSigmoid_3:y:0Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
IdentityIdentity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_1Identity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_2Identity	add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:PL
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_namestates:PL
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_namestates
"
Â
while_body_7607
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0)
while_lstm_cell_7631_0:	Ø*
while_lstm_cell_7633_0:
Ø%
while_lstm_cell_7635_0:	Ø
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor'
while_lstm_cell_7631:	Ø(
while_lstm_cell_7633:
Ø#
while_lstm_cell_7635:	Ø¢'while/lstm_cell/StatefulPartitionedCall
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0¢
'while/lstm_cell/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_placeholder_3while_lstm_cell_7631_0while_lstm_cell_7633_0while_lstm_cell_7635_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *P
_output_shapes>
<:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_7548Ù
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder0while/lstm_cell/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒ
while/Identity_4Identity0while/lstm_cell/StatefulPartitionedCall:output:1^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/Identity_5Identity0while/lstm_cell/StatefulPartitionedCall:output:2^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv

while/NoOpNoOp(^while/lstm_cell/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0".
while_lstm_cell_7631while_lstm_cell_7631_0".
while_lstm_cell_7633while_lstm_cell_7633_0".
while_lstm_cell_7635while_lstm_cell_7635_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2R
'while/lstm_cell/StatefulPartitionedCall'while/lstm_cell/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 

×
D__inference_sequential_layer_call_and_return_conditional_losses_8883

lstm_input
	lstm_8862:	Ø
	lstm_8864:
Ø
	lstm_8866:	Ø
lstm_1_8870:

lstm_1_8872:

lstm_1_8874:	

dense_8877:	

dense_8879:
identity¢dense/StatefulPartitionedCall¢dropout/StatefulPartitionedCall¢lstm/StatefulPartitionedCall¢lstm_1/StatefulPartitionedCalló
lstm/StatefulPartitionedCallStatefulPartitionedCall
lstm_input	lstm_8862	lstm_8864	lstm_8866*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *G
fBR@
>__inference_lstm_layer_call_and_return_conditional_losses_8739ë
dropout/StatefulPartitionedCallStatefulPartitionedCall%lstm/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_8580
lstm_1/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0lstm_1_8870lstm_1_8872lstm_1_8874*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_lstm_1_layer_call_and_return_conditional_losses_8551
dense/StatefulPartitionedCallStatefulPartitionedCall'lstm_1/StatefulPartitionedCall:output:0
dense_8877
dense_8879*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *H
fCRA
?__inference_dense_layer_call_and_return_conditional_losses_8359u
IdentityIdentity&dense/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿÈ
NoOpNoOp^dense/StatefulPartitionedCall ^dropout/StatefulPartitionedCall^lstm/StatefulPartitionedCall^lstm_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿ: : : : : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2<
lstm/StatefulPartitionedCalllstm/StatefulPartitionedCall2@
lstm_1/StatefulPartitionedCalllstm_1/StatefulPartitionedCall:W S
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
$
_user_specified_name
lstm_input

`
'__inference_dropout_layer_call_fn_10165

inputs
identity¢StatefulPartitionedCallÄ
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_8580t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs


`
A__inference_dropout_layer_call_and_return_conditional_losses_8580

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *UUU@i
dropout/MulMulinputsdropout/Const:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *333?«
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿt
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
IdentityIdentitydropout/Mul_1:z:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:T P
,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ö7
Ê
while_body_10714
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0F
2while_lstm_cell_1_matmul_readvariableop_resource_0:
H
4while_lstm_cell_1_matmul_1_readvariableop_resource_0:
B
3while_lstm_cell_1_biasadd_readvariableop_resource_0:	
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorD
0while_lstm_cell_1_matmul_readvariableop_resource:
F
2while_lstm_cell_1_matmul_1_readvariableop_resource:
@
1while_lstm_cell_1_biasadd_readvariableop_resource:	¢(while/lstm_cell_1/BiasAdd/ReadVariableOp¢'while/lstm_cell_1/MatMul/ReadVariableOp¢)while/lstm_cell_1/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   §
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
'while/lstm_cell_1/MatMul/ReadVariableOpReadVariableOp2while_lstm_cell_1_matmul_readvariableop_resource_0* 
_output_shapes
:
*
dtype0¸
while/lstm_cell_1/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0/while/lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
)while/lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp4while_lstm_cell_1_matmul_1_readvariableop_resource_0* 
_output_shapes
:
*
dtype0
while/lstm_cell_1/MatMul_1MatMulwhile_placeholder_21while/lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/addAddV2"while/lstm_cell_1/MatMul:product:0$while/lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
(while/lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp3while_lstm_cell_1_biasadd_readvariableop_resource_0*
_output_shapes	
:*
dtype0¤
while/lstm_cell_1/BiasAddBiasAddwhile/lstm_cell_1/add:z:00while/lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
!while/lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ð
while/lstm_cell_1/splitSplit*while/lstm_cell_1/split/split_dim:output:0"while/lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splity
while/lstm_cell_1/SigmoidSigmoid while/lstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_1Sigmoid while/lstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mulMulwhile/lstm_cell_1/Sigmoid_1:y:0while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_2Sigmoid while/lstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mul_1Mulwhile/lstm_cell_1/Sigmoid:y:0while/lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/add_1AddV2while/lstm_cell_1/mul:z:0while/lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_3Sigmoid while/lstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
while/lstm_cell_1/Sigmoid_4Sigmoidwhile/lstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mul_2Mulwhile/lstm_cell_1/Sigmoid_3:y:0while/lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÄ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell_1/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒy
while/Identity_4Identitywhile/lstm_cell_1/mul_2:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
while/Identity_5Identitywhile/lstm_cell_1/add_1:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÍ

while/NoOpNoOp)^while/lstm_cell_1/BiasAdd/ReadVariableOp(^while/lstm_cell_1/MatMul/ReadVariableOp*^while/lstm_cell_1/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"h
1while_lstm_cell_1_biasadd_readvariableop_resource3while_lstm_cell_1_biasadd_readvariableop_resource_0"j
2while_lstm_cell_1_matmul_1_readvariableop_resource4while_lstm_cell_1_matmul_1_readvariableop_resource_0"f
0while_lstm_cell_1_matmul_readvariableop_resource2while_lstm_cell_1_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2T
(while/lstm_cell_1/BiasAdd/ReadVariableOp(while/lstm_cell_1/BiasAdd/ReadVariableOp2R
'while/lstm_cell_1/MatMul/ReadVariableOp'while/lstm_cell_1/MatMul/ReadVariableOp2V
)while/lstm_cell_1/MatMul_1/ReadVariableOp)while/lstm_cell_1/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
¯
¹
while_cond_7415
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_7415___redundant_placeholder02
.while_while_cond_7415___redundant_placeholder12
.while_while_cond_7415___redundant_placeholder22
.while_while_cond_7415___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
ó	
Å
lstm_1_while_cond_9129*
&lstm_1_while_lstm_1_while_loop_counter0
,lstm_1_while_lstm_1_while_maximum_iterations
lstm_1_while_placeholder
lstm_1_while_placeholder_1
lstm_1_while_placeholder_2
lstm_1_while_placeholder_3,
(lstm_1_while_less_lstm_1_strided_slice_1@
<lstm_1_while_lstm_1_while_cond_9129___redundant_placeholder0@
<lstm_1_while_lstm_1_while_cond_9129___redundant_placeholder1@
<lstm_1_while_lstm_1_while_cond_9129___redundant_placeholder2@
<lstm_1_while_lstm_1_while_cond_9129___redundant_placeholder3
lstm_1_while_identity
~
lstm_1/while/LessLesslstm_1_while_placeholder(lstm_1_while_less_lstm_1_strided_slice_1*
T0*
_output_shapes
: Y
lstm_1/while/IdentityIdentitylstm_1/while/Less:z:0*
T0
*
_output_shapes
: "7
lstm_1_while_identitylstm_1/while/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
»	

lstm_while_cond_9278&
"lstm_while_lstm_while_loop_counter,
(lstm_while_lstm_while_maximum_iterations
lstm_while_placeholder
lstm_while_placeholder_1
lstm_while_placeholder_2
lstm_while_placeholder_3(
$lstm_while_less_lstm_strided_slice_1<
8lstm_while_lstm_while_cond_9278___redundant_placeholder0<
8lstm_while_lstm_while_cond_9278___redundant_placeholder1<
8lstm_while_lstm_while_cond_9278___redundant_placeholder2<
8lstm_while_lstm_while_cond_9278___redundant_placeholder3
lstm_while_identity
v
lstm/while/LessLesslstm_while_placeholder$lstm_while_less_lstm_strided_slice_1*
T0*
_output_shapes
: U
lstm/while/IdentityIdentitylstm/while/Less:z:0*
T0
*
_output_shapes
: "3
lstm_while_identitylstm/while/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:


a
B__inference_dropout_layer_call_and_return_conditional_losses_10182

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *UUU@i
dropout/MulMulinputsdropout/Const:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *333?«
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿt
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
IdentityIdentitydropout/Mul_1:z:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:T P
,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ç6
µ
while_body_9785
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0C
0while_lstm_cell_matmul_readvariableop_resource_0:	ØF
2while_lstm_cell_matmul_1_readvariableop_resource_0:
Ø@
1while_lstm_cell_biasadd_readvariableop_resource_0:	Ø
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorA
.while_lstm_cell_matmul_readvariableop_resource:	ØD
0while_lstm_cell_matmul_1_readvariableop_resource:
Ø>
/while_lstm_cell_biasadd_readvariableop_resource:	Ø¢&while/lstm_cell/BiasAdd/ReadVariableOp¢%while/lstm_cell/MatMul/ReadVariableOp¢'while/lstm_cell/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
%while/lstm_cell/MatMul/ReadVariableOpReadVariableOp0while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	Ø*
dtype0´
while/lstm_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0-while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
'while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp2while_lstm_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
Ø*
dtype0
while/lstm_cell/MatMul_1MatMulwhile_placeholder_2/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
while/lstm_cell/addAddV2 while/lstm_cell/MatMul:product:0"while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
&while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp1while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:Ø*
dtype0
while/lstm_cell/BiasAddBiasAddwhile/lstm_cell/add:z:0.while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØa
while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ê
while/lstm_cell/splitSplit(while/lstm_cell/split/split_dim:output:0 while/lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitu
while/lstm_cell/SigmoidSigmoidwhile/lstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/lstm_cell/Sigmoid_1Sigmoidwhile/lstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mulMulwhile/lstm_cell/Sigmoid_1:y:0while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
while/lstm_cell/ReluReluwhile/lstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mul_1Mulwhile/lstm_cell/Sigmoid:y:0"while/lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/add_1AddV2while/lstm_cell/mul:z:0while/lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/lstm_cell/Sigmoid_2Sigmoidwhile/lstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
while/lstm_cell/Relu_1Reluwhile/lstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mul_2Mulwhile/lstm_cell/Sigmoid_2:y:0$while/lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÂ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒw
while/Identity_4Identitywhile/lstm_cell/mul_2:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/Identity_5Identitywhile/lstm_cell/add_1:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÇ

while/NoOpNoOp'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"d
/while_lstm_cell_biasadd_readvariableop_resource1while_lstm_cell_biasadd_readvariableop_resource_0"f
0while_lstm_cell_matmul_1_readvariableop_resource2while_lstm_cell_matmul_1_readvariableop_resource_0"b
.while_lstm_cell_matmul_readvariableop_resource0while_lstm_cell_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2P
&while/lstm_cell/BiasAdd/ReadVariableOp&while/lstm_cell/BiasAdd/ReadVariableOp2N
%while/lstm_cell/MatMul/ReadVariableOp%while/lstm_cell/MatMul/ReadVariableOp2R
'while/lstm_cell/MatMul_1/ReadVariableOp'while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
´
¾
while_cond_10713
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_13
/while_while_cond_10713___redundant_placeholder03
/while_while_cond_10713___redundant_placeholder13
/while_while_cond_10713___redundant_placeholder23
/while_while_cond_10713___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
ï

D__inference_lstm_cell_layer_call_and_return_conditional_losses_10915

inputs
states_0
states_11
matmul_readvariableop_resource:	Ø4
 matmul_1_readvariableop_resource:
Ø.
biasadd_readvariableop_resource:	Ø
identity

identity_1

identity_2¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp¢MatMul_1/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØz
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0p
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØe
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0n
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØQ
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :º
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitU
SigmoidSigmoidsplit:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_1Sigmoidsplit:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
mulMulSigmoid_1:y:0states_1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿO
ReluRelusplit:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
mul_1MulSigmoid:y:0Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿU
add_1AddV2mul:z:0	mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_2Sigmoidsplit:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿL
Relu_1Relu	add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
mul_2MulSigmoid_2:y:0Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
IdentityIdentity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_1Identity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_2Identity	add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*T
_input_shapesC
A:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/0:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/1
ö7
Ê
while_body_10571
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0F
2while_lstm_cell_1_matmul_readvariableop_resource_0:
H
4while_lstm_cell_1_matmul_1_readvariableop_resource_0:
B
3while_lstm_cell_1_biasadd_readvariableop_resource_0:	
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorD
0while_lstm_cell_1_matmul_readvariableop_resource:
F
2while_lstm_cell_1_matmul_1_readvariableop_resource:
@
1while_lstm_cell_1_biasadd_readvariableop_resource:	¢(while/lstm_cell_1/BiasAdd/ReadVariableOp¢'while/lstm_cell_1/MatMul/ReadVariableOp¢)while/lstm_cell_1/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   §
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
'while/lstm_cell_1/MatMul/ReadVariableOpReadVariableOp2while_lstm_cell_1_matmul_readvariableop_resource_0* 
_output_shapes
:
*
dtype0¸
while/lstm_cell_1/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0/while/lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
)while/lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp4while_lstm_cell_1_matmul_1_readvariableop_resource_0* 
_output_shapes
:
*
dtype0
while/lstm_cell_1/MatMul_1MatMulwhile_placeholder_21while/lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/addAddV2"while/lstm_cell_1/MatMul:product:0$while/lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
(while/lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp3while_lstm_cell_1_biasadd_readvariableop_resource_0*
_output_shapes	
:*
dtype0¤
while/lstm_cell_1/BiasAddBiasAddwhile/lstm_cell_1/add:z:00while/lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
!while/lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ð
while/lstm_cell_1/splitSplit*while/lstm_cell_1/split/split_dim:output:0"while/lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splity
while/lstm_cell_1/SigmoidSigmoid while/lstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_1Sigmoid while/lstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mulMulwhile/lstm_cell_1/Sigmoid_1:y:0while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_2Sigmoid while/lstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mul_1Mulwhile/lstm_cell_1/Sigmoid:y:0while/lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/add_1AddV2while/lstm_cell_1/mul:z:0while/lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_3Sigmoid while/lstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
while/lstm_cell_1/Sigmoid_4Sigmoidwhile/lstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mul_2Mulwhile/lstm_cell_1/Sigmoid_3:y:0while/lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÄ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell_1/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒy
while/Identity_4Identitywhile/lstm_cell_1/mul_2:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
while/Identity_5Identitywhile/lstm_cell_1/add_1:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÍ

while/NoOpNoOp)^while/lstm_cell_1/BiasAdd/ReadVariableOp(^while/lstm_cell_1/MatMul/ReadVariableOp*^while/lstm_cell_1/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"h
1while_lstm_cell_1_biasadd_readvariableop_resource3while_lstm_cell_1_biasadd_readvariableop_resource_0"j
2while_lstm_cell_1_matmul_1_readvariableop_resource4while_lstm_cell_1_matmul_1_readvariableop_resource_0"f
0while_lstm_cell_1_matmul_readvariableop_resource2while_lstm_cell_1_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2T
(while/lstm_cell_1/BiasAdd/ReadVariableOp(while/lstm_cell_1/BiasAdd/ReadVariableOp2R
'while/lstm_cell_1/MatMul/ReadVariableOp'while/lstm_cell_1/MatMul/ReadVariableOp2V
)while/lstm_cell_1/MatMul_1/ReadVariableOp)while/lstm_cell_1/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
õ7
É
while_body_8467
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0F
2while_lstm_cell_1_matmul_readvariableop_resource_0:
H
4while_lstm_cell_1_matmul_1_readvariableop_resource_0:
B
3while_lstm_cell_1_biasadd_readvariableop_resource_0:	
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorD
0while_lstm_cell_1_matmul_readvariableop_resource:
F
2while_lstm_cell_1_matmul_1_readvariableop_resource:
@
1while_lstm_cell_1_biasadd_readvariableop_resource:	¢(while/lstm_cell_1/BiasAdd/ReadVariableOp¢'while/lstm_cell_1/MatMul/ReadVariableOp¢)while/lstm_cell_1/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   §
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
'while/lstm_cell_1/MatMul/ReadVariableOpReadVariableOp2while_lstm_cell_1_matmul_readvariableop_resource_0* 
_output_shapes
:
*
dtype0¸
while/lstm_cell_1/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0/while/lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
)while/lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp4while_lstm_cell_1_matmul_1_readvariableop_resource_0* 
_output_shapes
:
*
dtype0
while/lstm_cell_1/MatMul_1MatMulwhile_placeholder_21while/lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/addAddV2"while/lstm_cell_1/MatMul:product:0$while/lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
(while/lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp3while_lstm_cell_1_biasadd_readvariableop_resource_0*
_output_shapes	
:*
dtype0¤
while/lstm_cell_1/BiasAddBiasAddwhile/lstm_cell_1/add:z:00while/lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
!while/lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ð
while/lstm_cell_1/splitSplit*while/lstm_cell_1/split/split_dim:output:0"while/lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splity
while/lstm_cell_1/SigmoidSigmoid while/lstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_1Sigmoid while/lstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mulMulwhile/lstm_cell_1/Sigmoid_1:y:0while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_2Sigmoid while/lstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mul_1Mulwhile/lstm_cell_1/Sigmoid:y:0while/lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/add_1AddV2while/lstm_cell_1/mul:z:0while/lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_3Sigmoid while/lstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
while/lstm_cell_1/Sigmoid_4Sigmoidwhile/lstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mul_2Mulwhile/lstm_cell_1/Sigmoid_3:y:0while/lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÄ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell_1/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒy
while/Identity_4Identitywhile/lstm_cell_1/mul_2:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
while/Identity_5Identitywhile/lstm_cell_1/add_1:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÍ

while/NoOpNoOp)^while/lstm_cell_1/BiasAdd/ReadVariableOp(^while/lstm_cell_1/MatMul/ReadVariableOp*^while/lstm_cell_1/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"h
1while_lstm_cell_1_biasadd_readvariableop_resource3while_lstm_cell_1_biasadd_readvariableop_resource_0"j
2while_lstm_cell_1_matmul_1_readvariableop_resource4while_lstm_cell_1_matmul_1_readvariableop_resource_0"f
0while_lstm_cell_1_matmul_readvariableop_resource2while_lstm_cell_1_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2T
(while/lstm_cell_1/BiasAdd/ReadVariableOp(while/lstm_cell_1/BiasAdd/ReadVariableOp2R
'while/lstm_cell_1/MatMul/ReadVariableOp'while/lstm_cell_1/MatMul/ReadVariableOp2V
)while/lstm_cell_1/MatMul_1/ReadVariableOp)while/lstm_cell_1/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
ö7
Ê
while_body_10285
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0F
2while_lstm_cell_1_matmul_readvariableop_resource_0:
H
4while_lstm_cell_1_matmul_1_readvariableop_resource_0:
B
3while_lstm_cell_1_biasadd_readvariableop_resource_0:	
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorD
0while_lstm_cell_1_matmul_readvariableop_resource:
F
2while_lstm_cell_1_matmul_1_readvariableop_resource:
@
1while_lstm_cell_1_biasadd_readvariableop_resource:	¢(while/lstm_cell_1/BiasAdd/ReadVariableOp¢'while/lstm_cell_1/MatMul/ReadVariableOp¢)while/lstm_cell_1/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   §
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
'while/lstm_cell_1/MatMul/ReadVariableOpReadVariableOp2while_lstm_cell_1_matmul_readvariableop_resource_0* 
_output_shapes
:
*
dtype0¸
while/lstm_cell_1/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0/while/lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
)while/lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp4while_lstm_cell_1_matmul_1_readvariableop_resource_0* 
_output_shapes
:
*
dtype0
while/lstm_cell_1/MatMul_1MatMulwhile_placeholder_21while/lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/addAddV2"while/lstm_cell_1/MatMul:product:0$while/lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
(while/lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp3while_lstm_cell_1_biasadd_readvariableop_resource_0*
_output_shapes	
:*
dtype0¤
while/lstm_cell_1/BiasAddBiasAddwhile/lstm_cell_1/add:z:00while/lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
!while/lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ð
while/lstm_cell_1/splitSplit*while/lstm_cell_1/split/split_dim:output:0"while/lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splity
while/lstm_cell_1/SigmoidSigmoid while/lstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_1Sigmoid while/lstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mulMulwhile/lstm_cell_1/Sigmoid_1:y:0while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_2Sigmoid while/lstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mul_1Mulwhile/lstm_cell_1/Sigmoid:y:0while/lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/add_1AddV2while/lstm_cell_1/mul:z:0while/lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_3Sigmoid while/lstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
while/lstm_cell_1/Sigmoid_4Sigmoidwhile/lstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mul_2Mulwhile/lstm_cell_1/Sigmoid_3:y:0while/lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÄ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell_1/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒy
while/Identity_4Identitywhile/lstm_cell_1/mul_2:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
while/Identity_5Identitywhile/lstm_cell_1/add_1:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÍ

while/NoOpNoOp)^while/lstm_cell_1/BiasAdd/ReadVariableOp(^while/lstm_cell_1/MatMul/ReadVariableOp*^while/lstm_cell_1/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"h
1while_lstm_cell_1_biasadd_readvariableop_resource3while_lstm_cell_1_biasadd_readvariableop_resource_0"j
2while_lstm_cell_1_matmul_1_readvariableop_resource4while_lstm_cell_1_matmul_1_readvariableop_resource_0"f
0while_lstm_cell_1_matmul_readvariableop_resource2while_lstm_cell_1_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2T
(while/lstm_cell_1/BiasAdd/ReadVariableOp(while/lstm_cell_1/BiasAdd/ReadVariableOp2R
'while/lstm_cell_1/MatMul/ReadVariableOp'while/lstm_cell_1/MatMul/ReadVariableOp2V
)while/lstm_cell_1/MatMul_1/ReadVariableOp)while/lstm_cell_1/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
û
µ
&__inference_lstm_1_layer_call_fn_10226

inputs
unknown:

	unknown_0:

	unknown_1:	
identity¢StatefulPartitionedCallæ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_lstm_1_layer_call_and_return_conditional_losses_8551p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:ÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Õ
±
D__inference_sequential_layer_call_and_return_conditional_losses_8366

inputs
	lstm_8185:	Ø
	lstm_8187:
Ø
	lstm_8189:	Ø
lstm_1_8342:

lstm_1_8344:

lstm_1_8346:	

dense_8360:	

dense_8362:
identity¢dense/StatefulPartitionedCall¢lstm/StatefulPartitionedCall¢lstm_1/StatefulPartitionedCallï
lstm/StatefulPartitionedCallStatefulPartitionedCallinputs	lstm_8185	lstm_8187	lstm_8189*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *G
fBR@
>__inference_lstm_layer_call_and_return_conditional_losses_8184Û
dropout/PartitionedCallPartitionedCall%lstm/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_8197
lstm_1/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0lstm_1_8342lstm_1_8344lstm_1_8346*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_lstm_1_layer_call_and_return_conditional_losses_8341
dense/StatefulPartitionedCallStatefulPartitionedCall'lstm_1/StatefulPartitionedCall:output:0
dense_8360
dense_8362*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *H
fCRA
?__inference_dense_layer_call_and_return_conditional_losses_8359u
IdentityIdentity&dense/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¦
NoOpNoOp^dense/StatefulPartitionedCall^lstm/StatefulPartitionedCall^lstm_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿ: : : : : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2<
lstm/StatefulPartitionedCalllstm/StatefulPartitionedCall2@
lstm_1/StatefulPartitionedCalllstm_1/StatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ù<
Õ	
lstm_while_body_8990&
"lstm_while_lstm_while_loop_counter,
(lstm_while_lstm_while_maximum_iterations
lstm_while_placeholder
lstm_while_placeholder_1
lstm_while_placeholder_2
lstm_while_placeholder_3%
!lstm_while_lstm_strided_slice_1_0a
]lstm_while_tensorarrayv2read_tensorlistgetitem_lstm_tensorarrayunstack_tensorlistfromtensor_0H
5lstm_while_lstm_cell_matmul_readvariableop_resource_0:	ØK
7lstm_while_lstm_cell_matmul_1_readvariableop_resource_0:
ØE
6lstm_while_lstm_cell_biasadd_readvariableop_resource_0:	Ø
lstm_while_identity
lstm_while_identity_1
lstm_while_identity_2
lstm_while_identity_3
lstm_while_identity_4
lstm_while_identity_5#
lstm_while_lstm_strided_slice_1_
[lstm_while_tensorarrayv2read_tensorlistgetitem_lstm_tensorarrayunstack_tensorlistfromtensorF
3lstm_while_lstm_cell_matmul_readvariableop_resource:	ØI
5lstm_while_lstm_cell_matmul_1_readvariableop_resource:
ØC
4lstm_while_lstm_cell_biasadd_readvariableop_resource:	Ø¢+lstm/while/lstm_cell/BiasAdd/ReadVariableOp¢*lstm/while/lstm_cell/MatMul/ReadVariableOp¢,lstm/while/lstm_cell/MatMul_1/ReadVariableOp
<lstm/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¿
.lstm/while/TensorArrayV2Read/TensorListGetItemTensorListGetItem]lstm_while_tensorarrayv2read_tensorlistgetitem_lstm_tensorarrayunstack_tensorlistfromtensor_0lstm_while_placeholderElstm/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0¡
*lstm/while/lstm_cell/MatMul/ReadVariableOpReadVariableOp5lstm_while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	Ø*
dtype0Ã
lstm/while/lstm_cell/MatMulMatMul5lstm/while/TensorArrayV2Read/TensorListGetItem:item:02lstm/while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ¦
,lstm/while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp7lstm_while_lstm_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
Ø*
dtype0ª
lstm/while/lstm_cell/MatMul_1MatMullstm_while_placeholder_24lstm/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ¤
lstm/while/lstm_cell/addAddV2%lstm/while/lstm_cell/MatMul:product:0'lstm/while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
+lstm/while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp6lstm_while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:Ø*
dtype0­
lstm/while/lstm_cell/BiasAddBiasAddlstm/while/lstm_cell/add:z:03lstm/while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØf
$lstm/while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ù
lstm/while/lstm_cell/splitSplit-lstm/while/lstm_cell/split/split_dim:output:0%lstm/while/lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_split
lstm/while/lstm_cell/SigmoidSigmoid#lstm/while/lstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/while/lstm_cell/Sigmoid_1Sigmoid#lstm/while/lstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/while/lstm_cell/mulMul"lstm/while/lstm_cell/Sigmoid_1:y:0lstm_while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
lstm/while/lstm_cell/ReluRelu#lstm/while/lstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/while/lstm_cell/mul_1Mul lstm/while/lstm_cell/Sigmoid:y:0'lstm/while/lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/while/lstm_cell/add_1AddV2lstm/while/lstm_cell/mul:z:0lstm/while/lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/while/lstm_cell/Sigmoid_2Sigmoid#lstm/while/lstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
lstm/while/lstm_cell/Relu_1Relulstm/while/lstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ£
lstm/while/lstm_cell/mul_2Mul"lstm/while/lstm_cell/Sigmoid_2:y:0)lstm/while/lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÖ
/lstm/while/TensorArrayV2Write/TensorListSetItemTensorListSetItemlstm_while_placeholder_1lstm_while_placeholderlstm/while/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒR
lstm/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :k
lstm/while/addAddV2lstm_while_placeholderlstm/while/add/y:output:0*
T0*
_output_shapes
: T
lstm/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :{
lstm/while/add_1AddV2"lstm_while_lstm_while_loop_counterlstm/while/add_1/y:output:0*
T0*
_output_shapes
: h
lstm/while/IdentityIdentitylstm/while/add_1:z:0^lstm/while/NoOp*
T0*
_output_shapes
: ~
lstm/while/Identity_1Identity(lstm_while_lstm_while_maximum_iterations^lstm/while/NoOp*
T0*
_output_shapes
: h
lstm/while/Identity_2Identitylstm/while/add:z:0^lstm/while/NoOp*
T0*
_output_shapes
: ¨
lstm/while/Identity_3Identity?lstm/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^lstm/while/NoOp*
T0*
_output_shapes
: :éèÒ
lstm/while/Identity_4Identitylstm/while/lstm_cell/mul_2:z:0^lstm/while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/while/Identity_5Identitylstm/while/lstm_cell/add_1:z:0^lstm/while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÛ
lstm/while/NoOpNoOp,^lstm/while/lstm_cell/BiasAdd/ReadVariableOp+^lstm/while/lstm_cell/MatMul/ReadVariableOp-^lstm/while/lstm_cell/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "3
lstm_while_identitylstm/while/Identity:output:0"7
lstm_while_identity_1lstm/while/Identity_1:output:0"7
lstm_while_identity_2lstm/while/Identity_2:output:0"7
lstm_while_identity_3lstm/while/Identity_3:output:0"7
lstm_while_identity_4lstm/while/Identity_4:output:0"7
lstm_while_identity_5lstm/while/Identity_5:output:0"n
4lstm_while_lstm_cell_biasadd_readvariableop_resource6lstm_while_lstm_cell_biasadd_readvariableop_resource_0"p
5lstm_while_lstm_cell_matmul_1_readvariableop_resource7lstm_while_lstm_cell_matmul_1_readvariableop_resource_0"l
3lstm_while_lstm_cell_matmul_readvariableop_resource5lstm_while_lstm_cell_matmul_readvariableop_resource_0"D
lstm_while_lstm_strided_slice_1!lstm_while_lstm_strided_slice_1_0"¼
[lstm_while_tensorarrayv2read_tensorlistgetitem_lstm_tensorarrayunstack_tensorlistfromtensor]lstm_while_tensorarrayv2read_tensorlistgetitem_lstm_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2Z
+lstm/while/lstm_cell/BiasAdd/ReadVariableOp+lstm/while/lstm_cell/BiasAdd/ReadVariableOp2X
*lstm/while/lstm_cell/MatMul/ReadVariableOp*lstm/while/lstm_cell/MatMul/ReadVariableOp2\
,lstm/while/lstm_cell/MatMul_1/ReadVariableOp,lstm/while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
ÀJ

A__inference_lstm_1_layer_call_and_return_conditional_losses_10512
inputs_0>
*lstm_cell_1_matmul_readvariableop_resource:
@
,lstm_cell_1_matmul_1_readvariableop_resource:
:
+lstm_cell_1_biasadd_readvariableop_resource:	
identity¢"lstm_cell_1/BiasAdd/ReadVariableOp¢!lstm_cell_1/MatMul/ReadVariableOp¢#lstm_cell_1/MatMul_1/ReadVariableOp¢while=
ShapeShapeinputs_0*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          y
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ê
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
!lstm_cell_1/MatMul/ReadVariableOpReadVariableOp*lstm_cell_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
lstm_cell_1/MatMulMatMulstrided_slice_2:output:0)lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
#lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp,lstm_cell_1_matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0
lstm_cell_1/MatMul_1MatMulzeros:output:0+lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/addAddV2lstm_cell_1/MatMul:product:0lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp+lstm_cell_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
lstm_cell_1/BiasAddBiasAddlstm_cell_1/add:z:0*lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :Þ
lstm_cell_1/splitSplit$lstm_cell_1/split/split_dim:output:0lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitm
lstm_cell_1/SigmoidSigmoidlstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_1Sigmoidlstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
lstm_cell_1/mulMullstm_cell_1/Sigmoid_1:y:0zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_2Sigmoidlstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/mul_1Mullstm_cell_1/Sigmoid:y:0lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
lstm_cell_1/add_1AddV2lstm_cell_1/mul:z:0lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
lstm_cell_1/Sigmoid_3Sigmoidlstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
lstm_cell_1/Sigmoid_4Sigmoidlstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell_1/mul_2Mullstm_cell_1/Sigmoid_3:y:0lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0*lstm_cell_1_matmul_readvariableop_resource,lstm_cell_1_matmul_1_readvariableop_resource+lstm_cell_1_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_10428*
condR
while_cond_10427*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ì
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"           
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ½
NoOpNoOp#^lstm_cell_1/BiasAdd/ReadVariableOp"^lstm_cell_1/MatMul/ReadVariableOp$^lstm_cell_1/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : 2H
"lstm_cell_1/BiasAdd/ReadVariableOp"lstm_cell_1/BiasAdd/ReadVariableOp2F
!lstm_cell_1/MatMul/ReadVariableOp!lstm_cell_1/MatMul/ReadVariableOp2J
#lstm_cell_1/MatMul_1/ReadVariableOp#lstm_cell_1/MatMul_1/ReadVariableOp2
whilewhile:_ [
5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0
¯
¹
while_cond_9641
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_9641___redundant_placeholder02
.while_while_cond_9641___redundant_placeholder12
.while_while_cond_9641___redundant_placeholder22
.while_while_cond_9641___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
·	
Ã
"__inference_signature_wrapper_9539

lstm_input
unknown:	Ø
	unknown_0:
Ø
	unknown_1:	Ø
	unknown_2:

	unknown_3:

	unknown_4:	
	unknown_5:	
	unknown_6:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCall
lstm_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8 *(
f#R!
__inference__wrapped_model_7335o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿ: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
$
_user_specified_name
lstm_input
ï

D__inference_lstm_cell_layer_call_and_return_conditional_losses_10883

inputs
states_0
states_11
matmul_readvariableop_resource:	Ø4
 matmul_1_readvariableop_resource:
Ø.
biasadd_readvariableop_resource:	Ø
identity

identity_1

identity_2¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp¢MatMul_1/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØz
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0p
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØe
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0n
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØQ
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :º
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitU
SigmoidSigmoidsplit:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_1Sigmoidsplit:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
mulMulSigmoid_1:y:0states_1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿO
ReluRelusplit:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
mul_1MulSigmoid:y:0Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿU
add_1AddV2mul:z:0	mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_2Sigmoidsplit:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿL
Relu_1Relu	add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
mul_2MulSigmoid_2:y:0Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
IdentityIdentity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_1Identity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_2Identity	add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*T
_input_shapesC
A:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/0:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/1
ç6
µ
while_body_8655
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0C
0while_lstm_cell_matmul_readvariableop_resource_0:	ØF
2while_lstm_cell_matmul_1_readvariableop_resource_0:
Ø@
1while_lstm_cell_biasadd_readvariableop_resource_0:	Ø
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorA
.while_lstm_cell_matmul_readvariableop_resource:	ØD
0while_lstm_cell_matmul_1_readvariableop_resource:
Ø>
/while_lstm_cell_biasadd_readvariableop_resource:	Ø¢&while/lstm_cell/BiasAdd/ReadVariableOp¢%while/lstm_cell/MatMul/ReadVariableOp¢'while/lstm_cell/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
%while/lstm_cell/MatMul/ReadVariableOpReadVariableOp0while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	Ø*
dtype0´
while/lstm_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0-while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
'while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp2while_lstm_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
Ø*
dtype0
while/lstm_cell/MatMul_1MatMulwhile_placeholder_2/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
while/lstm_cell/addAddV2 while/lstm_cell/MatMul:product:0"while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
&while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp1while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:Ø*
dtype0
while/lstm_cell/BiasAddBiasAddwhile/lstm_cell/add:z:0.while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØa
while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ê
while/lstm_cell/splitSplit(while/lstm_cell/split/split_dim:output:0 while/lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitu
while/lstm_cell/SigmoidSigmoidwhile/lstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/lstm_cell/Sigmoid_1Sigmoidwhile/lstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mulMulwhile/lstm_cell/Sigmoid_1:y:0while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
while/lstm_cell/ReluReluwhile/lstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mul_1Mulwhile/lstm_cell/Sigmoid:y:0"while/lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/add_1AddV2while/lstm_cell/mul:z:0while/lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/lstm_cell/Sigmoid_2Sigmoidwhile/lstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
while/lstm_cell/Relu_1Reluwhile/lstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mul_2Mulwhile/lstm_cell/Sigmoid_2:y:0$while/lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÂ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒw
while/Identity_4Identitywhile/lstm_cell/mul_2:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/Identity_5Identitywhile/lstm_cell/add_1:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÇ

while/NoOpNoOp'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"d
/while_lstm_cell_biasadd_readvariableop_resource1while_lstm_cell_biasadd_readvariableop_resource_0"f
0while_lstm_cell_matmul_1_readvariableop_resource2while_lstm_cell_matmul_1_readvariableop_resource_0"b
.while_lstm_cell_matmul_readvariableop_resource0while_lstm_cell_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2P
&while/lstm_cell/BiasAdd/ReadVariableOp&while/lstm_cell/BiasAdd/ReadVariableOp2N
%while/lstm_cell/MatMul/ReadVariableOp%while/lstm_cell/MatMul/ReadVariableOp2R
'while/lstm_cell/MatMul_1/ReadVariableOp'while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
é
`
B__inference_dropout_layer_call_and_return_conditional_losses_10170

inputs

identity_1S
IdentityIdentityinputs*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`

Identity_1IdentityIdentity:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:T P
,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Û7
ï
>__inference_lstm_layer_call_and_return_conditional_losses_7676

inputs!
lstm_cell_7594:	Ø"
lstm_cell_7596:
Ø
lstm_cell_7598:	Ø
identity¢!lstm_cell/StatefulPartitionedCall¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          v
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maskä
!lstm_cell/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0zeros_1:output:0lstm_cell_7594lstm_cell_7596lstm_cell_7598*
Tin

2*
Tout
2*
_collective_manager_ids
 *P
_output_shapes>
<:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_7548n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ¨
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0lstm_cell_7594lstm_cell_7596lstm_cell_7598*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_7607*
condR
while_cond_7606*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ì
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"           
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    l
IdentityIdentitytranspose_1:y:0^NoOp*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿr
NoOpNoOp"^lstm_cell/StatefulPartitionedCall^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : 2F
!lstm_cell/StatefulPartitionedCall!lstm_cell/StatefulPartitionedCall2
whilewhile:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ü7
ú
@__inference_lstm_1_layer_call_and_return_conditional_losses_7835

inputs$
lstm_cell_1_7753:
$
lstm_cell_1_7755:

lstm_cell_1_7757:	
identity¢#lstm_cell_1/StatefulPartitionedCall¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          w
	transpose	Transposeinputstranspose/perm:output:0*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ê
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maskî
#lstm_cell_1/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0zeros_1:output:0lstm_cell_1_7753lstm_cell_1_7755lstm_cell_1_7757*
Tin

2*
Tout
2*
_collective_manager_ids
 *P
_output_shapes>
<:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_lstm_cell_1_layer_call_and_return_conditional_losses_7752n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ®
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0lstm_cell_1_7753lstm_cell_1_7755lstm_cell_1_7757*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_7766*
condR
while_cond_7765*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ì
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"           
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿt
NoOpNoOp$^lstm_cell_1/StatefulPartitionedCall^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : 2J
#lstm_cell_1/StatefulPartitionedCall#lstm_cell_1/StatefulPartitionedCall2
whilewhile:] Y
5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ð"
Ò
while_body_7957
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0,
while_lstm_cell_1_7981_0:
,
while_lstm_cell_1_7983_0:
'
while_lstm_cell_1_7985_0:	
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor*
while_lstm_cell_1_7981:
*
while_lstm_cell_1_7983:
%
while_lstm_cell_1_7985:	¢)while/lstm_cell_1/StatefulPartitionedCall
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   §
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0¬
)while/lstm_cell_1/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_placeholder_3while_lstm_cell_1_7981_0while_lstm_cell_1_7983_0while_lstm_cell_1_7985_0*
Tin

2*
Tout
2*
_collective_manager_ids
 *P
_output_shapes>
<:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_lstm_cell_1_layer_call_and_return_conditional_losses_7898Û
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder2while/lstm_cell_1/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒ
while/Identity_4Identity2while/lstm_cell_1/StatefulPartitionedCall:output:1^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/Identity_5Identity2while/lstm_cell_1/StatefulPartitionedCall:output:2^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿx

while/NoOpNoOp*^while/lstm_cell_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"2
while_lstm_cell_1_7981while_lstm_cell_1_7981_0"2
while_lstm_cell_1_7983while_lstm_cell_1_7983_0"2
while_lstm_cell_1_7985while_lstm_cell_1_7985_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2V
)while/lstm_cell_1/StatefulPartitionedCall)while/lstm_cell_1/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
ð
ù
sequential_lstm_while_cond_7104<
8sequential_lstm_while_sequential_lstm_while_loop_counterB
>sequential_lstm_while_sequential_lstm_while_maximum_iterations%
!sequential_lstm_while_placeholder'
#sequential_lstm_while_placeholder_1'
#sequential_lstm_while_placeholder_2'
#sequential_lstm_while_placeholder_3>
:sequential_lstm_while_less_sequential_lstm_strided_slice_1R
Nsequential_lstm_while_sequential_lstm_while_cond_7104___redundant_placeholder0R
Nsequential_lstm_while_sequential_lstm_while_cond_7104___redundant_placeholder1R
Nsequential_lstm_while_sequential_lstm_while_cond_7104___redundant_placeholder2R
Nsequential_lstm_while_sequential_lstm_while_cond_7104___redundant_placeholder3"
sequential_lstm_while_identity
¢
sequential/lstm/while/LessLess!sequential_lstm_while_placeholder:sequential_lstm_while_less_sequential_lstm_strided_slice_1*
T0*
_output_shapes
: k
sequential/lstm/while/IdentityIdentitysequential/lstm/while/Less:z:0*
T0
*
_output_shapes
: "I
sequential_lstm_while_identity'sequential/lstm/while/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
ð
ó
)__inference_lstm_cell_layer_call_fn_10834

inputs
states_0
states_1
unknown:	Ø
	unknown_0:
Ø
	unknown_1:	Ø
identity

identity_1

identity_2¢StatefulPartitionedCall©
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0states_1unknown	unknown_0	unknown_1*
Tin

2*
Tout
2*
_collective_manager_ids
 *P
_output_shapes>
<:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_7402p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr

Identity_2Identity StatefulPartitionedCall:output:2^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*T
_input_shapesC
A:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/0:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/1
¥
³
#__inference_lstm_layer_call_fn_9550
inputs_0
unknown:	Ø
	unknown_0:
Ø
	unknown_1:	Ø
identity¢StatefulPartitionedCalló
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *G
fBR@
>__inference_lstm_layer_call_and_return_conditional_losses_7485}
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0
Ù<
Õ	
lstm_while_body_9279&
"lstm_while_lstm_while_loop_counter,
(lstm_while_lstm_while_maximum_iterations
lstm_while_placeholder
lstm_while_placeholder_1
lstm_while_placeholder_2
lstm_while_placeholder_3%
!lstm_while_lstm_strided_slice_1_0a
]lstm_while_tensorarrayv2read_tensorlistgetitem_lstm_tensorarrayunstack_tensorlistfromtensor_0H
5lstm_while_lstm_cell_matmul_readvariableop_resource_0:	ØK
7lstm_while_lstm_cell_matmul_1_readvariableop_resource_0:
ØE
6lstm_while_lstm_cell_biasadd_readvariableop_resource_0:	Ø
lstm_while_identity
lstm_while_identity_1
lstm_while_identity_2
lstm_while_identity_3
lstm_while_identity_4
lstm_while_identity_5#
lstm_while_lstm_strided_slice_1_
[lstm_while_tensorarrayv2read_tensorlistgetitem_lstm_tensorarrayunstack_tensorlistfromtensorF
3lstm_while_lstm_cell_matmul_readvariableop_resource:	ØI
5lstm_while_lstm_cell_matmul_1_readvariableop_resource:
ØC
4lstm_while_lstm_cell_biasadd_readvariableop_resource:	Ø¢+lstm/while/lstm_cell/BiasAdd/ReadVariableOp¢*lstm/while/lstm_cell/MatMul/ReadVariableOp¢,lstm/while/lstm_cell/MatMul_1/ReadVariableOp
<lstm/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¿
.lstm/while/TensorArrayV2Read/TensorListGetItemTensorListGetItem]lstm_while_tensorarrayv2read_tensorlistgetitem_lstm_tensorarrayunstack_tensorlistfromtensor_0lstm_while_placeholderElstm/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0¡
*lstm/while/lstm_cell/MatMul/ReadVariableOpReadVariableOp5lstm_while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	Ø*
dtype0Ã
lstm/while/lstm_cell/MatMulMatMul5lstm/while/TensorArrayV2Read/TensorListGetItem:item:02lstm/while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ¦
,lstm/while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp7lstm_while_lstm_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
Ø*
dtype0ª
lstm/while/lstm_cell/MatMul_1MatMullstm_while_placeholder_24lstm/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ¤
lstm/while/lstm_cell/addAddV2%lstm/while/lstm_cell/MatMul:product:0'lstm/while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
+lstm/while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp6lstm_while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:Ø*
dtype0­
lstm/while/lstm_cell/BiasAddBiasAddlstm/while/lstm_cell/add:z:03lstm/while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØf
$lstm/while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ù
lstm/while/lstm_cell/splitSplit-lstm/while/lstm_cell/split/split_dim:output:0%lstm/while/lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_split
lstm/while/lstm_cell/SigmoidSigmoid#lstm/while/lstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/while/lstm_cell/Sigmoid_1Sigmoid#lstm/while/lstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/while/lstm_cell/mulMul"lstm/while/lstm_cell/Sigmoid_1:y:0lstm_while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
lstm/while/lstm_cell/ReluRelu#lstm/while/lstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/while/lstm_cell/mul_1Mul lstm/while/lstm_cell/Sigmoid:y:0'lstm/while/lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/while/lstm_cell/add_1AddV2lstm/while/lstm_cell/mul:z:0lstm/while/lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/while/lstm_cell/Sigmoid_2Sigmoid#lstm/while/lstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
lstm/while/lstm_cell/Relu_1Relulstm/while/lstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ£
lstm/while/lstm_cell/mul_2Mul"lstm/while/lstm_cell/Sigmoid_2:y:0)lstm/while/lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÖ
/lstm/while/TensorArrayV2Write/TensorListSetItemTensorListSetItemlstm_while_placeholder_1lstm_while_placeholderlstm/while/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒR
lstm/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :k
lstm/while/addAddV2lstm_while_placeholderlstm/while/add/y:output:0*
T0*
_output_shapes
: T
lstm/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :{
lstm/while/add_1AddV2"lstm_while_lstm_while_loop_counterlstm/while/add_1/y:output:0*
T0*
_output_shapes
: h
lstm/while/IdentityIdentitylstm/while/add_1:z:0^lstm/while/NoOp*
T0*
_output_shapes
: ~
lstm/while/Identity_1Identity(lstm_while_lstm_while_maximum_iterations^lstm/while/NoOp*
T0*
_output_shapes
: h
lstm/while/Identity_2Identitylstm/while/add:z:0^lstm/while/NoOp*
T0*
_output_shapes
: ¨
lstm/while/Identity_3Identity?lstm/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^lstm/while/NoOp*
T0*
_output_shapes
: :éèÒ
lstm/while/Identity_4Identitylstm/while/lstm_cell/mul_2:z:0^lstm/while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/while/Identity_5Identitylstm/while/lstm_cell/add_1:z:0^lstm/while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÛ
lstm/while/NoOpNoOp,^lstm/while/lstm_cell/BiasAdd/ReadVariableOp+^lstm/while/lstm_cell/MatMul/ReadVariableOp-^lstm/while/lstm_cell/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "3
lstm_while_identitylstm/while/Identity:output:0"7
lstm_while_identity_1lstm/while/Identity_1:output:0"7
lstm_while_identity_2lstm/while/Identity_2:output:0"7
lstm_while_identity_3lstm/while/Identity_3:output:0"7
lstm_while_identity_4lstm/while/Identity_4:output:0"7
lstm_while_identity_5lstm/while/Identity_5:output:0"n
4lstm_while_lstm_cell_biasadd_readvariableop_resource6lstm_while_lstm_cell_biasadd_readvariableop_resource_0"p
5lstm_while_lstm_cell_matmul_1_readvariableop_resource7lstm_while_lstm_cell_matmul_1_readvariableop_resource_0"l
3lstm_while_lstm_cell_matmul_readvariableop_resource5lstm_while_lstm_cell_matmul_readvariableop_resource_0"D
lstm_while_lstm_strided_slice_1!lstm_while_lstm_strided_slice_1_0"¼
[lstm_while_tensorarrayv2read_tensorlistgetitem_lstm_tensorarrayunstack_tensorlistfromtensor]lstm_while_tensorarrayv2read_tensorlistgetitem_lstm_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2Z
+lstm/while/lstm_cell/BiasAdd/ReadVariableOp+lstm/while/lstm_cell/BiasAdd/ReadVariableOp2X
*lstm/while/lstm_cell/MatMul/ReadVariableOp*lstm/while/lstm_cell/MatMul/ReadVariableOp2\
,lstm/while/lstm_cell/MatMul_1/ReadVariableOp,lstm/while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
è
_
A__inference_dropout_layer_call_and_return_conditional_losses_8197

inputs

identity_1S
IdentityIdentityinputs*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`

Identity_1IdentityIdentity:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:T P
,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¯
¹
while_cond_8256
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_8256___redundant_placeholder02
.while_while_cond_8256___redundant_placeholder12
.while_while_cond_8256___redundant_placeholder22
.while_while_cond_8256___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
Ð­
¿
D__inference_sequential_layer_call_and_return_conditional_losses_9516

inputs@
-lstm_lstm_cell_matmul_readvariableop_resource:	ØC
/lstm_lstm_cell_matmul_1_readvariableop_resource:
Ø=
.lstm_lstm_cell_biasadd_readvariableop_resource:	ØE
1lstm_1_lstm_cell_1_matmul_readvariableop_resource:
G
3lstm_1_lstm_cell_1_matmul_1_readvariableop_resource:
A
2lstm_1_lstm_cell_1_biasadd_readvariableop_resource:	7
$dense_matmul_readvariableop_resource:	3
%dense_biasadd_readvariableop_resource:
identity¢dense/BiasAdd/ReadVariableOp¢dense/MatMul/ReadVariableOp¢%lstm/lstm_cell/BiasAdd/ReadVariableOp¢$lstm/lstm_cell/MatMul/ReadVariableOp¢&lstm/lstm_cell/MatMul_1/ReadVariableOp¢
lstm/while¢)lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp¢(lstm_1/lstm_cell_1/MatMul/ReadVariableOp¢*lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp¢lstm_1/while@

lstm/ShapeShapeinputs*
T0*
_output_shapes
:b
lstm/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: d
lstm/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:d
lstm/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ê
lstm/strided_sliceStridedSlicelstm/Shape:output:0!lstm/strided_slice/stack:output:0#lstm/strided_slice/stack_1:output:0#lstm/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskV
lstm/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :
lstm/zeros/packedPacklstm/strided_slice:output:0lstm/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:U
lstm/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    |

lstm/zerosFilllstm/zeros/packed:output:0lstm/zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿX
lstm/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :
lstm/zeros_1/packedPacklstm/strided_slice:output:0lstm/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:W
lstm/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
lstm/zeros_1Filllstm/zeros_1/packed:output:0lstm/zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿh
lstm/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          w
lstm/transpose	Transposeinputslstm/transpose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿN
lstm/Shape_1Shapelstm/transpose:y:0*
T0*
_output_shapes
:d
lstm/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: f
lstm/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:f
lstm/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ô
lstm/strided_slice_1StridedSlicelstm/Shape_1:output:0#lstm/strided_slice_1/stack:output:0%lstm/strided_slice_1/stack_1:output:0%lstm/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskk
 lstm/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿÃ
lstm/TensorArrayV2TensorListReserve)lstm/TensorArrayV2/element_shape:output:0lstm/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
:lstm/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ï
,lstm/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorlstm/transpose:y:0Clstm/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒd
lstm/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: f
lstm/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:f
lstm/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
lstm/strided_slice_2StridedSlicelstm/transpose:y:0#lstm/strided_slice_2/stack:output:0%lstm/strided_slice_2/stack_1:output:0%lstm/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
$lstm/lstm_cell/MatMul/ReadVariableOpReadVariableOp-lstm_lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0
lstm/lstm_cell/MatMulMatMullstm/strided_slice_2:output:0,lstm/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
&lstm/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp/lstm_lstm_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0
lstm/lstm_cell/MatMul_1MatMullstm/zeros:output:0.lstm/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
lstm/lstm_cell/addAddV2lstm/lstm_cell/MatMul:product:0!lstm/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
%lstm/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp.lstm_lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0
lstm/lstm_cell/BiasAddBiasAddlstm/lstm_cell/add:z:0-lstm/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ`
lstm/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ç
lstm/lstm_cell/splitSplit'lstm/lstm_cell/split/split_dim:output:0lstm/lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splits
lstm/lstm_cell/SigmoidSigmoidlstm/lstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿu
lstm/lstm_cell/Sigmoid_1Sigmoidlstm/lstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/lstm_cell/mulMullstm/lstm_cell/Sigmoid_1:y:0lstm/zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿm
lstm/lstm_cell/ReluRelulstm/lstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/lstm_cell/mul_1Mullstm/lstm_cell/Sigmoid:y:0!lstm/lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/lstm_cell/add_1AddV2lstm/lstm_cell/mul:z:0lstm/lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿu
lstm/lstm_cell/Sigmoid_2Sigmoidlstm/lstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
lstm/lstm_cell/Relu_1Relulstm/lstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm/lstm_cell/mul_2Mullstm/lstm_cell/Sigmoid_2:y:0#lstm/lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
"lstm/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ç
lstm/TensorArrayV2_1TensorListReserve+lstm/TensorArrayV2_1/element_shape:output:0lstm/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒK
	lstm/timeConst*
_output_shapes
: *
dtype0*
value	B : h
lstm/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿY
lstm/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ¿

lstm/whileWhile lstm/while/loop_counter:output:0&lstm/while/maximum_iterations:output:0lstm/time:output:0lstm/TensorArrayV2_1:handle:0lstm/zeros:output:0lstm/zeros_1:output:0lstm/strided_slice_1:output:0<lstm/TensorArrayUnstack/TensorListFromTensor:output_handle:0-lstm_lstm_cell_matmul_readvariableop_resource/lstm_lstm_cell_matmul_1_readvariableop_resource.lstm_lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( * 
bodyR
lstm_while_body_9279* 
condR
lstm_while_cond_9278*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
5lstm/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ò
'lstm/TensorArrayV2Stack/TensorListStackTensorListStacklstm/while:output:3>lstm/TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0m
lstm/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿf
lstm/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: f
lstm/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¡
lstm/strided_slice_3StridedSlice0lstm/TensorArrayV2Stack/TensorListStack:tensor:0#lstm/strided_slice_3/stack:output:0%lstm/strided_slice_3/stack_1:output:0%lstm/strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maskj
lstm/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ¦
lstm/transpose_1	Transpose0lstm/TensorArrayV2Stack/TensorListStack:tensor:0lstm/transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
lstm/runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    Z
dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *UUU@
dropout/dropout/MulMullstm/transpose_1:y:0dropout/dropout/Const:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
dropout/dropout/ShapeShapelstm/transpose_1:y:0*
T0*
_output_shapes
:¡
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0c
dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *333?Ã
dropout/dropout/GreaterEqualGreaterEqual5dropout/dropout/random_uniform/RandomUniform:output:0'dropout/dropout/GreaterEqual/y:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dropout/dropout/CastCast dropout/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dropout/dropout/Mul_1Muldropout/dropout/Mul:z:0dropout/dropout/Cast:y:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿU
lstm_1/ShapeShapedropout/dropout/Mul_1:z:0*
T0*
_output_shapes
:d
lstm_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: f
lstm_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:f
lstm_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ô
lstm_1/strided_sliceStridedSlicelstm_1/Shape:output:0#lstm_1/strided_slice/stack:output:0%lstm_1/strided_slice/stack_1:output:0%lstm_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskX
lstm_1/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :
lstm_1/zeros/packedPacklstm_1/strided_slice:output:0lstm_1/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:W
lstm_1/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
lstm_1/zerosFilllstm_1/zeros/packed:output:0lstm_1/zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
lstm_1/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :
lstm_1/zeros_1/packedPacklstm_1/strided_slice:output:0 lstm_1/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:Y
lstm_1/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
lstm_1/zeros_1Filllstm_1/zeros_1/packed:output:0lstm_1/zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
lstm_1/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          
lstm_1/transpose	Transposedropout/dropout/Mul_1:z:0lstm_1/transpose/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿR
lstm_1/Shape_1Shapelstm_1/transpose:y:0*
T0*
_output_shapes
:f
lstm_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: h
lstm_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:h
lstm_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:þ
lstm_1/strided_slice_1StridedSlicelstm_1/Shape_1:output:0%lstm_1/strided_slice_1/stack:output:0'lstm_1/strided_slice_1/stack_1:output:0'lstm_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskm
"lstm_1/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿÉ
lstm_1/TensorArrayV2TensorListReserve+lstm_1/TensorArrayV2/element_shape:output:0lstm_1/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
<lstm_1/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   õ
.lstm_1/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorlstm_1/transpose:y:0Elstm_1/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒf
lstm_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: h
lstm_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:h
lstm_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
lstm_1/strided_slice_2StridedSlicelstm_1/transpose:y:0%lstm_1/strided_slice_2/stack:output:0'lstm_1/strided_slice_2/stack_1:output:0'lstm_1/strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
(lstm_1/lstm_cell_1/MatMul/ReadVariableOpReadVariableOp1lstm_1_lstm_cell_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0©
lstm_1/lstm_cell_1/MatMulMatMullstm_1/strided_slice_2:output:00lstm_1/lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
*lstm_1/lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp3lstm_1_lstm_cell_1_matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0£
lstm_1/lstm_cell_1/MatMul_1MatMullstm_1/zeros:output:02lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/lstm_cell_1/addAddV2#lstm_1/lstm_cell_1/MatMul:product:0%lstm_1/lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
)lstm_1/lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp2lstm_1_lstm_cell_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0§
lstm_1/lstm_cell_1/BiasAddBiasAddlstm_1/lstm_cell_1/add:z:01lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
"lstm_1/lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ó
lstm_1/lstm_cell_1/splitSplit+lstm_1/lstm_cell_1/split/split_dim:output:0#lstm_1/lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_split{
lstm_1/lstm_cell_1/SigmoidSigmoid!lstm_1/lstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ}
lstm_1/lstm_cell_1/Sigmoid_1Sigmoid!lstm_1/lstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/lstm_cell_1/mulMul lstm_1/lstm_cell_1/Sigmoid_1:y:0lstm_1/zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ}
lstm_1/lstm_cell_1/Sigmoid_2Sigmoid!lstm_1/lstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/lstm_cell_1/mul_1Mullstm_1/lstm_cell_1/Sigmoid:y:0 lstm_1/lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/lstm_cell_1/add_1AddV2lstm_1/lstm_cell_1/mul:z:0lstm_1/lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ}
lstm_1/lstm_cell_1/Sigmoid_3Sigmoid!lstm_1/lstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿx
lstm_1/lstm_cell_1/Sigmoid_4Sigmoidlstm_1/lstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/lstm_cell_1/mul_2Mul lstm_1/lstm_cell_1/Sigmoid_3:y:0 lstm_1/lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿu
$lstm_1/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Í
lstm_1/TensorArrayV2_1TensorListReserve-lstm_1/TensorArrayV2_1/element_shape:output:0lstm_1/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒM
lstm_1/timeConst*
_output_shapes
: *
dtype0*
value	B : j
lstm_1/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ[
lstm_1/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : á
lstm_1/whileWhile"lstm_1/while/loop_counter:output:0(lstm_1/while/maximum_iterations:output:0lstm_1/time:output:0lstm_1/TensorArrayV2_1:handle:0lstm_1/zeros:output:0lstm_1/zeros_1:output:0lstm_1/strided_slice_1:output:0>lstm_1/TensorArrayUnstack/TensorListFromTensor:output_handle:01lstm_1_lstm_cell_1_matmul_readvariableop_resource3lstm_1_lstm_cell_1_matmul_1_readvariableop_resource2lstm_1_lstm_cell_1_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *"
bodyR
lstm_1_while_body_9426*"
condR
lstm_1_while_cond_9425*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
7lstm_1/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ø
)lstm_1/TensorArrayV2Stack/TensorListStackTensorListStacklstm_1/while:output:3@lstm_1/TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0o
lstm_1/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿh
lstm_1/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: h
lstm_1/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:«
lstm_1/strided_slice_3StridedSlice2lstm_1/TensorArrayV2Stack/TensorListStack:tensor:0%lstm_1/strided_slice_3/stack:output:0'lstm_1/strided_slice_3/stack_1:output:0'lstm_1/strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maskl
lstm_1/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          ¬
lstm_1/transpose_1	Transpose2lstm_1/TensorArrayV2Stack/TensorListStack:tensor:0 lstm_1/transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿb
lstm_1/runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
dense/MatMulMatMullstm_1/strided_slice_3:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿe
IdentityIdentitydense/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp&^lstm/lstm_cell/BiasAdd/ReadVariableOp%^lstm/lstm_cell/MatMul/ReadVariableOp'^lstm/lstm_cell/MatMul_1/ReadVariableOp^lstm/while*^lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp)^lstm_1/lstm_cell_1/MatMul/ReadVariableOp+^lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp^lstm_1/while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿ: : : : : : : : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2N
%lstm/lstm_cell/BiasAdd/ReadVariableOp%lstm/lstm_cell/BiasAdd/ReadVariableOp2L
$lstm/lstm_cell/MatMul/ReadVariableOp$lstm/lstm_cell/MatMul/ReadVariableOp2P
&lstm/lstm_cell/MatMul_1/ReadVariableOp&lstm/lstm_cell/MatMul_1/ReadVariableOp2

lstm/while
lstm/while2V
)lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp)lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp2T
(lstm_1/lstm_cell_1/MatMul/ReadVariableOp(lstm_1/lstm_cell_1/MatMul/ReadVariableOp2X
*lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp*lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp2
lstm_1/whilelstm_1/while:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¨
¡
!sequential_lstm_1_while_cond_7244@
<sequential_lstm_1_while_sequential_lstm_1_while_loop_counterF
Bsequential_lstm_1_while_sequential_lstm_1_while_maximum_iterations'
#sequential_lstm_1_while_placeholder)
%sequential_lstm_1_while_placeholder_1)
%sequential_lstm_1_while_placeholder_2)
%sequential_lstm_1_while_placeholder_3B
>sequential_lstm_1_while_less_sequential_lstm_1_strided_slice_1V
Rsequential_lstm_1_while_sequential_lstm_1_while_cond_7244___redundant_placeholder0V
Rsequential_lstm_1_while_sequential_lstm_1_while_cond_7244___redundant_placeholder1V
Rsequential_lstm_1_while_sequential_lstm_1_while_cond_7244___redundant_placeholder2V
Rsequential_lstm_1_while_sequential_lstm_1_while_cond_7244___redundant_placeholder3$
 sequential_lstm_1_while_identity
ª
sequential/lstm_1/while/LessLess#sequential_lstm_1_while_placeholder>sequential_lstm_1_while_less_sequential_lstm_1_strided_slice_1*
T0*
_output_shapes
: o
 sequential/lstm_1/while/IdentityIdentity sequential/lstm_1/while/Less:z:0*
T0
*
_output_shapes
: "M
 sequential_lstm_1_while_identity)sequential/lstm_1/while/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
÷
ö
+__inference_lstm_cell_1_layer_call_fn_10932

inputs
states_0
states_1
unknown:

	unknown_0:

	unknown_1:	
identity

identity_1

identity_2¢StatefulPartitionedCall«
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0states_1unknown	unknown_0	unknown_1*
Tin

2*
Tout
2*
_collective_manager_ids
 *P
_output_shapes>
<:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_lstm_cell_1_layer_call_and_return_conditional_losses_7752p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr

Identity_2Identity StatefulPartitionedCall:output:2^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/0:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/1
ùÂ
ä
__inference__wrapped_model_7335

lstm_inputK
8sequential_lstm_lstm_cell_matmul_readvariableop_resource:	ØN
:sequential_lstm_lstm_cell_matmul_1_readvariableop_resource:
ØH
9sequential_lstm_lstm_cell_biasadd_readvariableop_resource:	ØP
<sequential_lstm_1_lstm_cell_1_matmul_readvariableop_resource:
R
>sequential_lstm_1_lstm_cell_1_matmul_1_readvariableop_resource:
L
=sequential_lstm_1_lstm_cell_1_biasadd_readvariableop_resource:	B
/sequential_dense_matmul_readvariableop_resource:	>
0sequential_dense_biasadd_readvariableop_resource:
identity¢'sequential/dense/BiasAdd/ReadVariableOp¢&sequential/dense/MatMul/ReadVariableOp¢0sequential/lstm/lstm_cell/BiasAdd/ReadVariableOp¢/sequential/lstm/lstm_cell/MatMul/ReadVariableOp¢1sequential/lstm/lstm_cell/MatMul_1/ReadVariableOp¢sequential/lstm/while¢4sequential/lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp¢3sequential/lstm_1/lstm_cell_1/MatMul/ReadVariableOp¢5sequential/lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp¢sequential/lstm_1/whileO
sequential/lstm/ShapeShape
lstm_input*
T0*
_output_shapes
:m
#sequential/lstm/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: o
%sequential/lstm/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:o
%sequential/lstm/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¡
sequential/lstm/strided_sliceStridedSlicesequential/lstm/Shape:output:0,sequential/lstm/strided_slice/stack:output:0.sequential/lstm/strided_slice/stack_1:output:0.sequential/lstm/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maska
sequential/lstm/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :£
sequential/lstm/zeros/packedPack&sequential/lstm/strided_slice:output:0'sequential/lstm/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:`
sequential/lstm/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
sequential/lstm/zerosFill%sequential/lstm/zeros/packed:output:0$sequential/lstm/zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
 sequential/lstm/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :§
sequential/lstm/zeros_1/packedPack&sequential/lstm/strided_slice:output:0)sequential/lstm/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:b
sequential/lstm/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    £
sequential/lstm/zeros_1Fill'sequential/lstm/zeros_1/packed:output:0&sequential/lstm/zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
sequential/lstm/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          
sequential/lstm/transpose	Transpose
lstm_input'sequential/lstm/transpose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
sequential/lstm/Shape_1Shapesequential/lstm/transpose:y:0*
T0*
_output_shapes
:o
%sequential/lstm/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: q
'sequential/lstm/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:q
'sequential/lstm/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:«
sequential/lstm/strided_slice_1StridedSlice sequential/lstm/Shape_1:output:0.sequential/lstm/strided_slice_1/stack:output:00sequential/lstm/strided_slice_1/stack_1:output:00sequential/lstm/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskv
+sequential/lstm/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿä
sequential/lstm/TensorArrayV2TensorListReserve4sequential/lstm/TensorArrayV2/element_shape:output:0(sequential/lstm/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
Esequential/lstm/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   
7sequential/lstm/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorsequential/lstm/transpose:y:0Nsequential/lstm/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒo
%sequential/lstm/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: q
'sequential/lstm/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:q
'sequential/lstm/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¹
sequential/lstm/strided_slice_2StridedSlicesequential/lstm/transpose:y:0.sequential/lstm/strided_slice_2/stack:output:00sequential/lstm/strided_slice_2/stack_1:output:00sequential/lstm/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask©
/sequential/lstm/lstm_cell/MatMul/ReadVariableOpReadVariableOp8sequential_lstm_lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0À
 sequential/lstm/lstm_cell/MatMulMatMul(sequential/lstm/strided_slice_2:output:07sequential/lstm/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ®
1sequential/lstm/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp:sequential_lstm_lstm_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0º
"sequential/lstm/lstm_cell/MatMul_1MatMulsequential/lstm/zeros:output:09sequential/lstm/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ³
sequential/lstm/lstm_cell/addAddV2*sequential/lstm/lstm_cell/MatMul:product:0,sequential/lstm/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ§
0sequential/lstm/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp9sequential_lstm_lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0¼
!sequential/lstm/lstm_cell/BiasAddBiasAdd!sequential/lstm/lstm_cell/add:z:08sequential/lstm/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØk
)sequential/lstm/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :
sequential/lstm/lstm_cell/splitSplit2sequential/lstm/lstm_cell/split/split_dim:output:0*sequential/lstm/lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_split
!sequential/lstm/lstm_cell/SigmoidSigmoid(sequential/lstm/lstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
#sequential/lstm/lstm_cell/Sigmoid_1Sigmoid(sequential/lstm/lstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¢
sequential/lstm/lstm_cell/mulMul'sequential/lstm/lstm_cell/Sigmoid_1:y:0 sequential/lstm/zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
sequential/lstm/lstm_cell/ReluRelu(sequential/lstm/lstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ®
sequential/lstm/lstm_cell/mul_1Mul%sequential/lstm/lstm_cell/Sigmoid:y:0,sequential/lstm/lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ£
sequential/lstm/lstm_cell/add_1AddV2!sequential/lstm/lstm_cell/mul:z:0#sequential/lstm/lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
#sequential/lstm/lstm_cell/Sigmoid_2Sigmoid(sequential/lstm/lstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 sequential/lstm/lstm_cell/Relu_1Relu#sequential/lstm/lstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ²
sequential/lstm/lstm_cell/mul_2Mul'sequential/lstm/lstm_cell/Sigmoid_2:y:0.sequential/lstm/lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
-sequential/lstm/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   è
sequential/lstm/TensorArrayV2_1TensorListReserve6sequential/lstm/TensorArrayV2_1/element_shape:output:0(sequential/lstm/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒV
sequential/lstm/timeConst*
_output_shapes
: *
dtype0*
value	B : s
(sequential/lstm/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿd
"sequential/lstm/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : Ù
sequential/lstm/whileWhile+sequential/lstm/while/loop_counter:output:01sequential/lstm/while/maximum_iterations:output:0sequential/lstm/time:output:0(sequential/lstm/TensorArrayV2_1:handle:0sequential/lstm/zeros:output:0 sequential/lstm/zeros_1:output:0(sequential/lstm/strided_slice_1:output:0Gsequential/lstm/TensorArrayUnstack/TensorListFromTensor:output_handle:08sequential_lstm_lstm_cell_matmul_readvariableop_resource:sequential_lstm_lstm_cell_matmul_1_readvariableop_resource9sequential_lstm_lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *+
body#R!
sequential_lstm_while_body_7105*+
cond#R!
sequential_lstm_while_cond_7104*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
@sequential/lstm/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ó
2sequential/lstm/TensorArrayV2Stack/TensorListStackTensorListStacksequential/lstm/while:output:3Isequential/lstm/TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0x
%sequential/lstm/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿq
'sequential/lstm/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: q
'sequential/lstm/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ø
sequential/lstm/strided_slice_3StridedSlice;sequential/lstm/TensorArrayV2Stack/TensorListStack:tensor:0.sequential/lstm/strided_slice_3/stack:output:00sequential/lstm/strided_slice_3/stack_1:output:00sequential/lstm/strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_masku
 sequential/lstm/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          Ç
sequential/lstm/transpose_1	Transpose;sequential/lstm/TensorArrayV2Stack/TensorListStack:tensor:0)sequential/lstm/transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
sequential/lstm/runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    
sequential/dropout/IdentityIdentitysequential/lstm/transpose_1:y:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
sequential/lstm_1/ShapeShape$sequential/dropout/Identity:output:0*
T0*
_output_shapes
:o
%sequential/lstm_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: q
'sequential/lstm_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:q
'sequential/lstm_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:«
sequential/lstm_1/strided_sliceStridedSlice sequential/lstm_1/Shape:output:0.sequential/lstm_1/strided_slice/stack:output:00sequential/lstm_1/strided_slice/stack_1:output:00sequential/lstm_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskc
 sequential/lstm_1/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :©
sequential/lstm_1/zeros/packedPack(sequential/lstm_1/strided_slice:output:0)sequential/lstm_1/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:b
sequential/lstm_1/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    £
sequential/lstm_1/zerosFill'sequential/lstm_1/zeros/packed:output:0&sequential/lstm_1/zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿe
"sequential/lstm_1/zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :­
 sequential/lstm_1/zeros_1/packedPack(sequential/lstm_1/strided_slice:output:0+sequential/lstm_1/zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:d
sequential/lstm_1/zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    ©
sequential/lstm_1/zeros_1Fill)sequential/lstm_1/zeros_1/packed:output:0(sequential/lstm_1/zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿu
 sequential/lstm_1/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          °
sequential/lstm_1/transpose	Transpose$sequential/dropout/Identity:output:0)sequential/lstm_1/transpose/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿh
sequential/lstm_1/Shape_1Shapesequential/lstm_1/transpose:y:0*
T0*
_output_shapes
:q
'sequential/lstm_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: s
)sequential/lstm_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:s
)sequential/lstm_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:µ
!sequential/lstm_1/strided_slice_1StridedSlice"sequential/lstm_1/Shape_1:output:00sequential/lstm_1/strided_slice_1/stack:output:02sequential/lstm_1/strided_slice_1/stack_1:output:02sequential/lstm_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskx
-sequential/lstm_1/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿê
sequential/lstm_1/TensorArrayV2TensorListReserve6sequential/lstm_1/TensorArrayV2/element_shape:output:0*sequential/lstm_1/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
Gsequential/lstm_1/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   
9sequential/lstm_1/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorsequential/lstm_1/transpose:y:0Psequential/lstm_1/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒq
'sequential/lstm_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: s
)sequential/lstm_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:s
)sequential/lstm_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ä
!sequential/lstm_1/strided_slice_2StridedSlicesequential/lstm_1/transpose:y:00sequential/lstm_1/strided_slice_2/stack:output:02sequential/lstm_1/strided_slice_2/stack_1:output:02sequential/lstm_1/strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask²
3sequential/lstm_1/lstm_cell_1/MatMul/ReadVariableOpReadVariableOp<sequential_lstm_1_lstm_cell_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0Ê
$sequential/lstm_1/lstm_cell_1/MatMulMatMul*sequential/lstm_1/strided_slice_2:output:0;sequential/lstm_1/lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¶
5sequential/lstm_1/lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp>sequential_lstm_1_lstm_cell_1_matmul_1_readvariableop_resource* 
_output_shapes
:
*
dtype0Ä
&sequential/lstm_1/lstm_cell_1/MatMul_1MatMul sequential/lstm_1/zeros:output:0=sequential/lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¿
!sequential/lstm_1/lstm_cell_1/addAddV2.sequential/lstm_1/lstm_cell_1/MatMul:product:00sequential/lstm_1/lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¯
4sequential/lstm_1/lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp=sequential_lstm_1_lstm_cell_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0È
%sequential/lstm_1/lstm_cell_1/BiasAddBiasAdd%sequential/lstm_1/lstm_cell_1/add:z:0<sequential/lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
-sequential/lstm_1/lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :
#sequential/lstm_1/lstm_cell_1/splitSplit6sequential/lstm_1/lstm_cell_1/split/split_dim:output:0.sequential/lstm_1/lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_split
%sequential/lstm_1/lstm_cell_1/SigmoidSigmoid,sequential/lstm_1/lstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
'sequential/lstm_1/lstm_cell_1/Sigmoid_1Sigmoid,sequential/lstm_1/lstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬
!sequential/lstm_1/lstm_cell_1/mulMul+sequential/lstm_1/lstm_cell_1/Sigmoid_1:y:0"sequential/lstm_1/zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
'sequential/lstm_1/lstm_cell_1/Sigmoid_2Sigmoid,sequential/lstm_1/lstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿµ
#sequential/lstm_1/lstm_cell_1/mul_1Mul)sequential/lstm_1/lstm_cell_1/Sigmoid:y:0+sequential/lstm_1/lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¯
#sequential/lstm_1/lstm_cell_1/add_1AddV2%sequential/lstm_1/lstm_cell_1/mul:z:0'sequential/lstm_1/lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
'sequential/lstm_1/lstm_cell_1/Sigmoid_3Sigmoid,sequential/lstm_1/lstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
'sequential/lstm_1/lstm_cell_1/Sigmoid_4Sigmoid'sequential/lstm_1/lstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ·
#sequential/lstm_1/lstm_cell_1/mul_2Mul+sequential/lstm_1/lstm_cell_1/Sigmoid_3:y:0+sequential/lstm_1/lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
/sequential/lstm_1/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   î
!sequential/lstm_1/TensorArrayV2_1TensorListReserve8sequential/lstm_1/TensorArrayV2_1/element_shape:output:0*sequential/lstm_1/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒX
sequential/lstm_1/timeConst*
_output_shapes
: *
dtype0*
value	B : u
*sequential/lstm_1/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿf
$sequential/lstm_1/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : û
sequential/lstm_1/whileWhile-sequential/lstm_1/while/loop_counter:output:03sequential/lstm_1/while/maximum_iterations:output:0sequential/lstm_1/time:output:0*sequential/lstm_1/TensorArrayV2_1:handle:0 sequential/lstm_1/zeros:output:0"sequential/lstm_1/zeros_1:output:0*sequential/lstm_1/strided_slice_1:output:0Isequential/lstm_1/TensorArrayUnstack/TensorListFromTensor:output_handle:0<sequential_lstm_1_lstm_cell_1_matmul_readvariableop_resource>sequential_lstm_1_lstm_cell_1_matmul_1_readvariableop_resource=sequential_lstm_1_lstm_cell_1_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *-
body%R#
!sequential_lstm_1_while_body_7245*-
cond%R#
!sequential_lstm_1_while_cond_7244*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
Bsequential/lstm_1/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ù
4sequential/lstm_1/TensorArrayV2Stack/TensorListStackTensorListStack sequential/lstm_1/while:output:3Ksequential/lstm_1/TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0z
'sequential/lstm_1/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿs
)sequential/lstm_1/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: s
)sequential/lstm_1/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:â
!sequential/lstm_1/strided_slice_3StridedSlice=sequential/lstm_1/TensorArrayV2Stack/TensorListStack:tensor:00sequential/lstm_1/strided_slice_3/stack:output:02sequential/lstm_1/strided_slice_3/stack_1:output:02sequential/lstm_1/strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maskw
"sequential/lstm_1/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          Í
sequential/lstm_1/transpose_1	Transpose=sequential/lstm_1/TensorArrayV2Stack/TensorListStack:tensor:0+sequential/lstm_1/transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿm
sequential/lstm_1/runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    
&sequential/dense/MatMul/ReadVariableOpReadVariableOp/sequential_dense_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0¯
sequential/dense/MatMulMatMul*sequential/lstm_1/strided_slice_3:output:0.sequential/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
'sequential/dense/BiasAdd/ReadVariableOpReadVariableOp0sequential_dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0©
sequential/dense/BiasAddBiasAdd!sequential/dense/MatMul:product:0/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿp
IdentityIdentity!sequential/dense/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp(^sequential/dense/BiasAdd/ReadVariableOp'^sequential/dense/MatMul/ReadVariableOp1^sequential/lstm/lstm_cell/BiasAdd/ReadVariableOp0^sequential/lstm/lstm_cell/MatMul/ReadVariableOp2^sequential/lstm/lstm_cell/MatMul_1/ReadVariableOp^sequential/lstm/while5^sequential/lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp4^sequential/lstm_1/lstm_cell_1/MatMul/ReadVariableOp6^sequential/lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp^sequential/lstm_1/while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':ÿÿÿÿÿÿÿÿÿ: : : : : : : : 2R
'sequential/dense/BiasAdd/ReadVariableOp'sequential/dense/BiasAdd/ReadVariableOp2P
&sequential/dense/MatMul/ReadVariableOp&sequential/dense/MatMul/ReadVariableOp2d
0sequential/lstm/lstm_cell/BiasAdd/ReadVariableOp0sequential/lstm/lstm_cell/BiasAdd/ReadVariableOp2b
/sequential/lstm/lstm_cell/MatMul/ReadVariableOp/sequential/lstm/lstm_cell/MatMul/ReadVariableOp2f
1sequential/lstm/lstm_cell/MatMul_1/ReadVariableOp1sequential/lstm/lstm_cell/MatMul_1/ReadVariableOp2.
sequential/lstm/whilesequential/lstm/while2l
4sequential/lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp4sequential/lstm_1/lstm_cell_1/BiasAdd/ReadVariableOp2j
3sequential/lstm_1/lstm_cell_1/MatMul/ReadVariableOp3sequential/lstm_1/lstm_cell_1/MatMul/ReadVariableOp2n
5sequential/lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp5sequential/lstm_1/lstm_cell_1/MatMul_1/ReadVariableOp22
sequential/lstm_1/whilesequential/lstm_1/while:W S
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
$
_user_specified_name
lstm_input
@
©

lstm_1_while_body_9426*
&lstm_1_while_lstm_1_while_loop_counter0
,lstm_1_while_lstm_1_while_maximum_iterations
lstm_1_while_placeholder
lstm_1_while_placeholder_1
lstm_1_while_placeholder_2
lstm_1_while_placeholder_3)
%lstm_1_while_lstm_1_strided_slice_1_0e
alstm_1_while_tensorarrayv2read_tensorlistgetitem_lstm_1_tensorarrayunstack_tensorlistfromtensor_0M
9lstm_1_while_lstm_cell_1_matmul_readvariableop_resource_0:
O
;lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource_0:
I
:lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource_0:	
lstm_1_while_identity
lstm_1_while_identity_1
lstm_1_while_identity_2
lstm_1_while_identity_3
lstm_1_while_identity_4
lstm_1_while_identity_5'
#lstm_1_while_lstm_1_strided_slice_1c
_lstm_1_while_tensorarrayv2read_tensorlistgetitem_lstm_1_tensorarrayunstack_tensorlistfromtensorK
7lstm_1_while_lstm_cell_1_matmul_readvariableop_resource:
M
9lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource:
G
8lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource:	¢/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp¢.lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp¢0lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp
>lstm_1/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ê
0lstm_1/while/TensorArrayV2Read/TensorListGetItemTensorListGetItemalstm_1_while_tensorarrayv2read_tensorlistgetitem_lstm_1_tensorarrayunstack_tensorlistfromtensor_0lstm_1_while_placeholderGlstm_1/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0ª
.lstm_1/while/lstm_cell_1/MatMul/ReadVariableOpReadVariableOp9lstm_1_while_lstm_cell_1_matmul_readvariableop_resource_0* 
_output_shapes
:
*
dtype0Í
lstm_1/while/lstm_cell_1/MatMulMatMul7lstm_1/while/TensorArrayV2Read/TensorListGetItem:item:06lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ®
0lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp;lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource_0* 
_output_shapes
:
*
dtype0´
!lstm_1/while/lstm_cell_1/MatMul_1MatMullstm_1_while_placeholder_28lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ°
lstm_1/while/lstm_cell_1/addAddV2)lstm_1/while/lstm_cell_1/MatMul:product:0+lstm_1/while/lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ§
/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp:lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource_0*
_output_shapes	
:*
dtype0¹
 lstm_1/while/lstm_cell_1/BiasAddBiasAdd lstm_1/while/lstm_cell_1/add:z:07lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
(lstm_1/while/lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :
lstm_1/while/lstm_cell_1/splitSplit1lstm_1/while/lstm_cell_1/split/split_dim:output:0)lstm_1/while/lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_split
 lstm_1/while/lstm_cell_1/SigmoidSigmoid'lstm_1/while/lstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_1/while/lstm_cell_1/Sigmoid_1Sigmoid'lstm_1/while/lstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/while/lstm_cell_1/mulMul&lstm_1/while/lstm_cell_1/Sigmoid_1:y:0lstm_1_while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_1/while/lstm_cell_1/Sigmoid_2Sigmoid'lstm_1/while/lstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¦
lstm_1/while/lstm_cell_1/mul_1Mul$lstm_1/while/lstm_cell_1/Sigmoid:y:0&lstm_1/while/lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
lstm_1/while/lstm_cell_1/add_1AddV2 lstm_1/while/lstm_cell_1/mul:z:0"lstm_1/while/lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_1/while/lstm_cell_1/Sigmoid_3Sigmoid'lstm_1/while/lstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"lstm_1/while/lstm_cell_1/Sigmoid_4Sigmoid"lstm_1/while/lstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¨
lstm_1/while/lstm_cell_1/mul_2Mul&lstm_1/while/lstm_cell_1/Sigmoid_3:y:0&lstm_1/while/lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿà
1lstm_1/while/TensorArrayV2Write/TensorListSetItemTensorListSetItemlstm_1_while_placeholder_1lstm_1_while_placeholder"lstm_1/while/lstm_cell_1/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒT
lstm_1/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :q
lstm_1/while/addAddV2lstm_1_while_placeholderlstm_1/while/add/y:output:0*
T0*
_output_shapes
: V
lstm_1/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :
lstm_1/while/add_1AddV2&lstm_1_while_lstm_1_while_loop_counterlstm_1/while/add_1/y:output:0*
T0*
_output_shapes
: n
lstm_1/while/IdentityIdentitylstm_1/while/add_1:z:0^lstm_1/while/NoOp*
T0*
_output_shapes
: 
lstm_1/while/Identity_1Identity,lstm_1_while_lstm_1_while_maximum_iterations^lstm_1/while/NoOp*
T0*
_output_shapes
: n
lstm_1/while/Identity_2Identitylstm_1/while/add:z:0^lstm_1/while/NoOp*
T0*
_output_shapes
: ®
lstm_1/while/Identity_3IdentityAlstm_1/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^lstm_1/while/NoOp*
T0*
_output_shapes
: :éèÒ
lstm_1/while/Identity_4Identity"lstm_1/while/lstm_cell_1/mul_2:z:0^lstm_1/while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_1/while/Identity_5Identity"lstm_1/while/lstm_cell_1/add_1:z:0^lstm_1/while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿé
lstm_1/while/NoOpNoOp0^lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp/^lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp1^lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "7
lstm_1_while_identitylstm_1/while/Identity:output:0";
lstm_1_while_identity_1 lstm_1/while/Identity_1:output:0";
lstm_1_while_identity_2 lstm_1/while/Identity_2:output:0";
lstm_1_while_identity_3 lstm_1/while/Identity_3:output:0";
lstm_1_while_identity_4 lstm_1/while/Identity_4:output:0";
lstm_1_while_identity_5 lstm_1/while/Identity_5:output:0"L
#lstm_1_while_lstm_1_strided_slice_1%lstm_1_while_lstm_1_strided_slice_1_0"v
8lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource:lstm_1_while_lstm_cell_1_biasadd_readvariableop_resource_0"x
9lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource;lstm_1_while_lstm_cell_1_matmul_1_readvariableop_resource_0"t
7lstm_1_while_lstm_cell_1_matmul_readvariableop_resource9lstm_1_while_lstm_cell_1_matmul_readvariableop_resource_0"Ä
_lstm_1_while_tensorarrayv2read_tensorlistgetitem_lstm_1_tensorarrayunstack_tensorlistfromtensoralstm_1_while_tensorarrayv2read_tensorlistgetitem_lstm_1_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2b
/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp/lstm_1/while/lstm_cell_1/BiasAdd/ReadVariableOp2`
.lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp.lstm_1/while/lstm_cell_1/MatMul/ReadVariableOp2d
0lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp0lstm_1/while/lstm_cell_1/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
÷
ö
+__inference_lstm_cell_1_layer_call_fn_10949

inputs
states_0
states_1
unknown:

	unknown_0:

	unknown_1:	
identity

identity_1

identity_2¢StatefulPartitionedCall«
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0states_1unknown	unknown_0	unknown_1*
Tin

2*
Tout
2*
_collective_manager_ids
 *P
_output_shapes>
<:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_lstm_cell_1_layer_call_and_return_conditional_losses_7898p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr

Identity_2Identity StatefulPartitionedCall:output:2^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/0:RN
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
states/1
è6
¶
while_body_10071
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0C
0while_lstm_cell_matmul_readvariableop_resource_0:	ØF
2while_lstm_cell_matmul_1_readvariableop_resource_0:
Ø@
1while_lstm_cell_biasadd_readvariableop_resource_0:	Ø
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorA
.while_lstm_cell_matmul_readvariableop_resource:	ØD
0while_lstm_cell_matmul_1_readvariableop_resource:
Ø>
/while_lstm_cell_biasadd_readvariableop_resource:	Ø¢&while/lstm_cell/BiasAdd/ReadVariableOp¢%while/lstm_cell/MatMul/ReadVariableOp¢'while/lstm_cell/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¦
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
%while/lstm_cell/MatMul/ReadVariableOpReadVariableOp0while_lstm_cell_matmul_readvariableop_resource_0*
_output_shapes
:	Ø*
dtype0´
while/lstm_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0-while/lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
'while/lstm_cell/MatMul_1/ReadVariableOpReadVariableOp2while_lstm_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
Ø*
dtype0
while/lstm_cell/MatMul_1MatMulwhile_placeholder_2/while/lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
while/lstm_cell/addAddV2 while/lstm_cell/MatMul:product:0"while/lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
&while/lstm_cell/BiasAdd/ReadVariableOpReadVariableOp1while_lstm_cell_biasadd_readvariableop_resource_0*
_output_shapes	
:Ø*
dtype0
while/lstm_cell/BiasAddBiasAddwhile/lstm_cell/add:z:0.while/lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØa
while/lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ê
while/lstm_cell/splitSplit(while/lstm_cell/split/split_dim:output:0 while/lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitu
while/lstm_cell/SigmoidSigmoidwhile/lstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/lstm_cell/Sigmoid_1Sigmoidwhile/lstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mulMulwhile/lstm_cell/Sigmoid_1:y:0while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿo
while/lstm_cell/ReluReluwhile/lstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mul_1Mulwhile/lstm_cell/Sigmoid:y:0"while/lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/add_1AddV2while/lstm_cell/mul:z:0while/lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/lstm_cell/Sigmoid_2Sigmoidwhile/lstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿl
while/lstm_cell/Relu_1Reluwhile/lstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell/mul_2Mulwhile/lstm_cell/Sigmoid_2:y:0$while/lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÂ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒw
while/Identity_4Identitywhile/lstm_cell/mul_2:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
while/Identity_5Identitywhile/lstm_cell/add_1:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÇ

while/NoOpNoOp'^while/lstm_cell/BiasAdd/ReadVariableOp&^while/lstm_cell/MatMul/ReadVariableOp(^while/lstm_cell/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"d
/while_lstm_cell_biasadd_readvariableop_resource1while_lstm_cell_biasadd_readvariableop_resource_0"f
0while_lstm_cell_matmul_1_readvariableop_resource2while_lstm_cell_matmul_1_readvariableop_resource_0"b
.while_lstm_cell_matmul_readvariableop_resource0while_lstm_cell_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2P
&while/lstm_cell/BiasAdd/ReadVariableOp&while/lstm_cell/BiasAdd/ReadVariableOp2N
%while/lstm_cell/MatMul/ReadVariableOp%while/lstm_cell/MatMul/ReadVariableOp2R
'while/lstm_cell/MatMul_1/ReadVariableOp'while/lstm_cell/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
æ

C__inference_lstm_cell_layer_call_and_return_conditional_losses_7548

inputs

states
states_11
matmul_readvariableop_resource:	Ø4
 matmul_1_readvariableop_resource:
Ø.
biasadd_readvariableop_resource:	Ø
identity

identity_1

identity_2¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp¢MatMul_1/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØz
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0n
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØe
addAddV2MatMul:product:0MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0n
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØQ
split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :º
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splitU
SigmoidSigmoidsplit:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_1Sigmoidsplit:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿV
mulMulSigmoid_1:y:0states_1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿO
ReluRelusplit:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
mul_1MulSigmoid:y:0Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿU
add_1AddV2mul:z:0	mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
	Sigmoid_2Sigmoidsplit:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿL
Relu_1Relu	add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
mul_2MulSigmoid_2:y:0Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
IdentityIdentity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_1Identity	mul_2:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[

Identity_2Identity	add_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0*(
_construction_contextkEagerRuntime*T
_input_shapesC
A:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:PL
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_namestates:PL
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_namestates
´
¾
while_cond_10570
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_13
/while_while_cond_10570___redundant_placeholder03
/while_while_cond_10570___redundant_placeholder13
/while_while_cond_10570___redundant_placeholder23
/while_while_cond_10570___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
´
¾
while_cond_10070
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_13
/while_while_cond_10070___redundant_placeholder03
/while_while_cond_10070___redundant_placeholder13
/while_while_cond_10070___redundant_placeholder23
/while_while_cond_10070___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
Û7
ï
>__inference_lstm_layer_call_and_return_conditional_losses_7485

inputs!
lstm_cell_7403:	Ø"
lstm_cell_7405:
Ø
lstm_cell_7407:	Ø
identity¢!lstm_cell/StatefulPartitionedCall¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          v
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maskä
!lstm_cell/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0zeros_1:output:0lstm_cell_7403lstm_cell_7405lstm_cell_7407*
Tin

2*
Tout
2*
_collective_manager_ids
 *P
_output_shapes>
<:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_lstm_cell_layer_call_and_return_conditional_losses_7402n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : ¨
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0lstm_cell_7403lstm_cell_7405lstm_cell_7407*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_7416*
condR
while_cond_7415*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ì
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"           
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    l
IdentityIdentitytranspose_1:y:0^NoOp*
T0*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿr
NoOpNoOp"^lstm_cell/StatefulPartitionedCall^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ: : : 2F
!lstm_cell/StatefulPartitionedCall!lstm_cell/StatefulPartitionedCall2
whilewhile:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
õ7
É
while_body_8257
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0F
2while_lstm_cell_1_matmul_readvariableop_resource_0:
H
4while_lstm_cell_1_matmul_1_readvariableop_resource_0:
B
3while_lstm_cell_1_biasadd_readvariableop_resource_0:	
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_identity_5
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorD
0while_lstm_cell_1_matmul_readvariableop_resource:
F
2while_lstm_cell_1_matmul_1_readvariableop_resource:
@
1while_lstm_cell_1_biasadd_readvariableop_resource:	¢(while/lstm_cell_1/BiasAdd/ReadVariableOp¢'while/lstm_cell_1/MatMul/ReadVariableOp¢)while/lstm_cell_1/MatMul_1/ReadVariableOp
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   §
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0
'while/lstm_cell_1/MatMul/ReadVariableOpReadVariableOp2while_lstm_cell_1_matmul_readvariableop_resource_0* 
_output_shapes
:
*
dtype0¸
while/lstm_cell_1/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0/while/lstm_cell_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
)while/lstm_cell_1/MatMul_1/ReadVariableOpReadVariableOp4while_lstm_cell_1_matmul_1_readvariableop_resource_0* 
_output_shapes
:
*
dtype0
while/lstm_cell_1/MatMul_1MatMulwhile_placeholder_21while/lstm_cell_1/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/addAddV2"while/lstm_cell_1/MatMul:product:0$while/lstm_cell_1/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
(while/lstm_cell_1/BiasAdd/ReadVariableOpReadVariableOp3while_lstm_cell_1_biasadd_readvariableop_resource_0*
_output_shapes	
:*
dtype0¤
while/lstm_cell_1/BiasAddBiasAddwhile/lstm_cell_1/add:z:00while/lstm_cell_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
!while/lstm_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :ð
while/lstm_cell_1/splitSplit*while/lstm_cell_1/split/split_dim:output:0"while/lstm_cell_1/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_splity
while/lstm_cell_1/SigmoidSigmoid while/lstm_cell_1/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_1Sigmoid while/lstm_cell_1/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mulMulwhile/lstm_cell_1/Sigmoid_1:y:0while_placeholder_3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_2Sigmoid while/lstm_cell_1/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mul_1Mulwhile/lstm_cell_1/Sigmoid:y:0while/lstm_cell_1/Sigmoid_2:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/add_1AddV2while/lstm_cell_1/mul:z:0while/lstm_cell_1/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
while/lstm_cell_1/Sigmoid_3Sigmoid while/lstm_cell_1/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
while/lstm_cell_1/Sigmoid_4Sigmoidwhile/lstm_cell_1/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
while/lstm_cell_1/mul_2Mulwhile/lstm_cell_1/Sigmoid_3:y:0while/lstm_cell_1/Sigmoid_4:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÄ
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholderwhile/lstm_cell_1/mul_2:z:0*
_output_shapes
: *
element_dtype0:éèÒM
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: :éèÒy
while/Identity_4Identitywhile/lstm_cell_1/mul_2:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿy
while/Identity_5Identitywhile/lstm_cell_1/add_1:z:0^while/NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿÍ

while/NoOpNoOp)^while/lstm_cell_1/BiasAdd/ReadVariableOp(^while/lstm_cell_1/MatMul/ReadVariableOp*^while/lstm_cell_1/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"-
while_identity_5while/Identity_5:output:0"h
1while_lstm_cell_1_biasadd_readvariableop_resource3while_lstm_cell_1_biasadd_readvariableop_resource_0"j
2while_lstm_cell_1_matmul_1_readvariableop_resource4while_lstm_cell_1_matmul_1_readvariableop_resource_0"f
0while_lstm_cell_1_matmul_readvariableop_resource2while_lstm_cell_1_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"¨
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*M
_input_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : 2T
(while/lstm_cell_1/BiasAdd/ReadVariableOp(while/lstm_cell_1/BiasAdd/ReadVariableOp2R
'while/lstm_cell_1/MatMul/ReadVariableOp'while/lstm_cell_1/MatMul/ReadVariableOp2V
)while/lstm_cell_1/MatMul_1/ReadVariableOp)while/lstm_cell_1/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
: 
¯
C
'__inference_dropout_layer_call_fn_10160

inputs
identity´
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_8197e
IdentityIdentityPartitionedCall:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:T P
,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
´
¾
while_cond_10284
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_13
/while_while_cond_10284___redundant_placeholder03
/while_while_cond_10284___redundant_placeholder13
/while_while_cond_10284___redundant_placeholder23
/while_while_cond_10284___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
¯
¹
while_cond_9927
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_placeholder_3
while_less_strided_slice_12
.while_while_cond_9927___redundant_placeholder02
.while_while_cond_9927___redundant_placeholder12
.while_while_cond_9927___redundant_placeholder22
.while_while_cond_9927___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*U
_input_shapesD
B: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:.*
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ:

_output_shapes
: :

_output_shapes
:
I

?__inference_lstm_layer_call_and_return_conditional_losses_10155

inputs;
(lstm_cell_matmul_readvariableop_resource:	Ø>
*lstm_cell_matmul_1_readvariableop_resource:
Ø8
)lstm_cell_biasadd_readvariableop_resource:	Ø
identity¢ lstm_cell/BiasAdd/ReadVariableOp¢lstm_cell/MatMul/ReadVariableOp¢!lstm_cell/MatMul_1/ReadVariableOp¢while;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ñ
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿS
zeros_1/packed/1Const*
_output_shapes
: *
dtype0*
value
B :w
zeros_1/packedPackstrided_slice:output:0zeros_1/packed/1:output:0*
N*
T0*
_output_shapes
:R
zeros_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    s
zeros_1Fillzeros_1/packed:output:0zeros_1/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          m
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿD
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Û
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ´
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   à
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒ_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:é
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_mask
lstm_cell/MatMul/ReadVariableOpReadVariableOp(lstm_cell_matmul_readvariableop_resource*
_output_shapes
:	Ø*
dtype0
lstm_cell/MatMulMatMulstrided_slice_2:output:0'lstm_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
!lstm_cell/MatMul_1/ReadVariableOpReadVariableOp*lstm_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
Ø*
dtype0
lstm_cell/MatMul_1MatMulzeros:output:0)lstm_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
lstm_cell/addAddV2lstm_cell/MatMul:product:0lstm_cell/MatMul_1:product:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ
 lstm_cell/BiasAdd/ReadVariableOpReadVariableOp)lstm_cell_biasadd_readvariableop_resource*
_output_shapes	
:Ø*
dtype0
lstm_cell/BiasAddBiasAddlstm_cell/add:z:0(lstm_cell/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿØ[
lstm_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B :Ø
lstm_cell/splitSplit"lstm_cell/split/split_dim:output:0lstm_cell/BiasAdd:output:0*
T0*d
_output_shapesR
P:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ*
	num_spliti
lstm_cell/SigmoidSigmoidlstm_cell/split:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
lstm_cell/Sigmoid_1Sigmoidlstm_cell/split:output:1*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
lstm_cell/mulMullstm_cell/Sigmoid_1:y:0zeros_1:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿc
lstm_cell/ReluRelulstm_cell/split:output:2*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ~
lstm_cell/mul_1Mullstm_cell/Sigmoid:y:0lstm_cell/Relu:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
lstm_cell/add_1AddV2lstm_cell/mul:z:0lstm_cell/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿk
lstm_cell/Sigmoid_2Sigmoidlstm_cell/split:output:3*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
lstm_cell/Relu_1Relulstm_cell/add_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
lstm_cell/mul_2Mullstm_cell/Sigmoid_2:y:0lstm_cell/Relu_1:activations:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿn
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   ¸
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:éèÒF
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿT
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : û
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0zeros_1:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0(lstm_cell_matmul_readvariableop_resource*lstm_cell_matmul_1_readvariableop_resource)lstm_cell_biasadd_readvariableop_resource*
T
2*
_lower_using_switch_merge(*
_num_original_outputs*N
_output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *%
_read_only_resource_inputs
	
*
_stateful_parallelism( *
bodyR
while_body_10071*
condR
while_cond_10070*M
output_shapes<
:: : : : :ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ: : : : : *
parallel_iterations 
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ   Ã
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
element_dtype0h
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿa
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    c
IdentityIdentitytranspose_1:y:0^NoOp*
T0*,
_output_shapes
:ÿÿÿÿÿÿÿÿÿ·
NoOpNoOp!^lstm_cell/BiasAdd/ReadVariableOp ^lstm_cell/MatMul/ReadVariableOp"^lstm_cell/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : : 2D
 lstm_cell/BiasAdd/ReadVariableOp lstm_cell/BiasAdd/ReadVariableOp2B
lstm_cell/MatMul/ReadVariableOplstm_cell/MatMul/ReadVariableOp2F
!lstm_cell/MatMul_1/ReadVariableOp!lstm_cell/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs"ÛL
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*²
serving_default
E

lstm_input7
serving_default_lstm_input:0ÿÿÿÿÿÿÿÿÿ9
dense0
StatefulPartitionedCall:0ÿÿÿÿÿÿÿÿÿtensorflow/serving/predict:§
è
layer_with_weights-0
layer-0
layer-1
layer_with_weights-1
layer-2
layer_with_weights-2
layer-3
	optimizer
	variables
trainable_variables
regularization_losses
		keras_api

__call__
*&call_and_return_all_conditional_losses
_default_save_signature

signatures"
_tf_keras_sequential
Ú
cell

state_spec
	variables
trainable_variables
regularization_losses
	keras_api
_random_generator
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_rnn_layer
¼
	variables
trainable_variables
regularization_losses
	keras_api
_random_generator
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_layer
Ú
cell

state_spec
 	variables
!trainable_variables
"regularization_losses
#	keras_api
$_random_generator
%__call__
*&&call_and_return_all_conditional_losses"
_tf_keras_rnn_layer
»

'kernel
(bias
)	variables
*trainable_variables
+regularization_losses
,	keras_api
-__call__
*.&call_and_return_all_conditional_losses"
_tf_keras_layer
è
/iter

0beta_1

1beta_2
	2decay
3learning_rate'mu(mv4mw5mx6my7mz8m{9m|'v}(v~4v5v6v7v8v9v"
	optimizer
X
40
51
62
73
84
95
'6
(7"
trackable_list_wrapper
X
40
51
62
73
84
95
'6
(7"
trackable_list_wrapper
 "
trackable_list_wrapper
Ê
:non_trainable_variables

;layers
<metrics
=layer_regularization_losses
>layer_metrics
	variables
trainable_variables
regularization_losses

__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
ò2ï
)__inference_sequential_layer_call_fn_8385
)__inference_sequential_layer_call_fn_8910
)__inference_sequential_layer_call_fn_8931
)__inference_sequential_layer_call_fn_8835À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Þ2Û
D__inference_sequential_layer_call_and_return_conditional_losses_9220
D__inference_sequential_layer_call_and_return_conditional_losses_9516
D__inference_sequential_layer_call_and_return_conditional_losses_8859
D__inference_sequential_layer_call_and_return_conditional_losses_8883À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
ÍBÊ
__inference__wrapped_model_7335
lstm_input"
²
FullArgSpec
args 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
,
?serving_default"
signature_map
ø
@
state_size

4kernel
5recurrent_kernel
6bias
A	variables
Btrainable_variables
Cregularization_losses
D	keras_api
E_random_generator
F__call__
*G&call_and_return_all_conditional_losses"
_tf_keras_layer
 "
trackable_list_wrapper
5
40
51
62"
trackable_list_wrapper
5
40
51
62"
trackable_list_wrapper
 "
trackable_list_wrapper
¹

Hstates
Inon_trainable_variables

Jlayers
Kmetrics
Llayer_regularization_losses
Mlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
ï2ì
#__inference_lstm_layer_call_fn_9550
#__inference_lstm_layer_call_fn_9561
#__inference_lstm_layer_call_fn_9572
#__inference_lstm_layer_call_fn_9583Õ
Ì²È
FullArgSpecB
args:7
jself
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults

 
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Ý2Ú
>__inference_lstm_layer_call_and_return_conditional_losses_9726
>__inference_lstm_layer_call_and_return_conditional_losses_9869
?__inference_lstm_layer_call_and_return_conditional_losses_10012
?__inference_lstm_layer_call_and_return_conditional_losses_10155Õ
Ì²È
FullArgSpecB
args:7
jself
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults

 
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
­
Nnon_trainable_variables

Olayers
Pmetrics
Qlayer_regularization_losses
Rlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
2
'__inference_dropout_layer_call_fn_10160
'__inference_dropout_layer_call_fn_10165´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Â2¿
B__inference_dropout_layer_call_and_return_conditional_losses_10170
B__inference_dropout_layer_call_and_return_conditional_losses_10182´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
ø
S
state_size

7kernel
8recurrent_kernel
9bias
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X_random_generator
Y__call__
*Z&call_and_return_all_conditional_losses"
_tf_keras_layer
 "
trackable_list_wrapper
5
70
81
92"
trackable_list_wrapper
5
70
81
92"
trackable_list_wrapper
 "
trackable_list_wrapper
¹

[states
\non_trainable_variables

]layers
^metrics
_layer_regularization_losses
`layer_metrics
 	variables
!trainable_variables
"regularization_losses
%__call__
*&&call_and_return_all_conditional_losses
&&"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
û2ø
&__inference_lstm_1_layer_call_fn_10193
&__inference_lstm_1_layer_call_fn_10204
&__inference_lstm_1_layer_call_fn_10215
&__inference_lstm_1_layer_call_fn_10226Õ
Ì²È
FullArgSpecB
args:7
jself
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults

 
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
ç2ä
A__inference_lstm_1_layer_call_and_return_conditional_losses_10369
A__inference_lstm_1_layer_call_and_return_conditional_losses_10512
A__inference_lstm_1_layer_call_and_return_conditional_losses_10655
A__inference_lstm_1_layer_call_and_return_conditional_losses_10798Õ
Ì²È
FullArgSpecB
args:7
jself
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults

 
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
:	2dense/kernel
:2
dense/bias
.
'0
(1"
trackable_list_wrapper
.
'0
(1"
trackable_list_wrapper
 "
trackable_list_wrapper
­
anon_trainable_variables

blayers
cmetrics
dlayer_regularization_losses
elayer_metrics
)	variables
*trainable_variables
+regularization_losses
-__call__
*.&call_and_return_all_conditional_losses
&."call_and_return_conditional_losses"
_generic_user_object
Ï2Ì
%__inference_dense_layer_call_fn_10807¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ê2ç
@__inference_dense_layer_call_and_return_conditional_losses_10817¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
:	 (2Adamax/iter
: (2Adamax/beta_1
: (2Adamax/beta_2
: (2Adamax/decay
: (2Adamax/learning_rate
(:&	Ø2lstm/lstm_cell/kernel
3:1
Ø2lstm/lstm_cell/recurrent_kernel
": Ø2lstm/lstm_cell/bias
-:+
2lstm_1/lstm_cell_1/kernel
7:5
2#lstm_1/lstm_cell_1/recurrent_kernel
&:$2lstm_1/lstm_cell_1/bias
 "
trackable_list_wrapper
<
0
1
2
3"
trackable_list_wrapper
'
f0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ÌBÉ
"__inference_signature_wrapper_9539
lstm_input"
²
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
5
40
51
62"
trackable_list_wrapper
5
40
51
62"
trackable_list_wrapper
 "
trackable_list_wrapper
­
gnon_trainable_variables

hlayers
imetrics
jlayer_regularization_losses
klayer_metrics
A	variables
Btrainable_variables
Cregularization_losses
F__call__
*G&call_and_return_all_conditional_losses
&G"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
2
)__inference_lstm_cell_layer_call_fn_10834
)__inference_lstm_cell_layer_call_fn_10851¾
µ²±
FullArgSpec3
args+(
jself
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Ð2Í
D__inference_lstm_cell_layer_call_and_return_conditional_losses_10883
D__inference_lstm_cell_layer_call_and_return_conditional_losses_10915¾
µ²±
FullArgSpec3
args+(
jself
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
5
70
81
92"
trackable_list_wrapper
5
70
81
92"
trackable_list_wrapper
 "
trackable_list_wrapper
­
lnon_trainable_variables

mlayers
nmetrics
olayer_regularization_losses
player_metrics
T	variables
Utrainable_variables
Vregularization_losses
Y__call__
*Z&call_and_return_all_conditional_losses
&Z"call_and_return_conditional_losses"
_generic_user_object
"
_generic_user_object
2
+__inference_lstm_cell_1_layer_call_fn_10932
+__inference_lstm_cell_1_layer_call_fn_10949¾
µ²±
FullArgSpec3
args+(
jself
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
Ô2Ñ
F__inference_lstm_cell_1_layer_call_and_return_conditional_losses_10981
F__inference_lstm_cell_1_layer_call_and_return_conditional_losses_11013¾
µ²±
FullArgSpec3
args+(
jself
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
N
	qtotal
	rcount
s	variables
t	keras_api"
_tf_keras_metric
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
:  (2total
:  (2count
.
q0
r1"
trackable_list_wrapper
-
s	variables"
_generic_user_object
&:$	2Adamax/dense/kernel/m
:2Adamax/dense/bias/m
/:-	Ø2Adamax/lstm/lstm_cell/kernel/m
::8
Ø2(Adamax/lstm/lstm_cell/recurrent_kernel/m
):'Ø2Adamax/lstm/lstm_cell/bias/m
4:2
2"Adamax/lstm_1/lstm_cell_1/kernel/m
>:<
2,Adamax/lstm_1/lstm_cell_1/recurrent_kernel/m
-:+2 Adamax/lstm_1/lstm_cell_1/bias/m
&:$	2Adamax/dense/kernel/v
:2Adamax/dense/bias/v
/:-	Ø2Adamax/lstm/lstm_cell/kernel/v
::8
Ø2(Adamax/lstm/lstm_cell/recurrent_kernel/v
):'Ø2Adamax/lstm/lstm_cell/bias/v
4:2
2"Adamax/lstm_1/lstm_cell_1/kernel/v
>:<
2,Adamax/lstm_1/lstm_cell_1/recurrent_kernel/v
-:+2 Adamax/lstm_1/lstm_cell_1/bias/v
__inference__wrapped_model_7335r456789'(7¢4
-¢*
(%

lstm_inputÿÿÿÿÿÿÿÿÿ
ª "-ª*
(
dense
denseÿÿÿÿÿÿÿÿÿ¡
@__inference_dense_layer_call_and_return_conditional_losses_10817]'(0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 y
%__inference_dense_layer_call_fn_10807P'(0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "ÿÿÿÿÿÿÿÿÿ¬
B__inference_dropout_layer_call_and_return_conditional_losses_10170f8¢5
.¢+
%"
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "*¢'
 
0ÿÿÿÿÿÿÿÿÿ
 ¬
B__inference_dropout_layer_call_and_return_conditional_losses_10182f8¢5
.¢+
%"
inputsÿÿÿÿÿÿÿÿÿ
p
ª "*¢'
 
0ÿÿÿÿÿÿÿÿÿ
 
'__inference_dropout_layer_call_fn_10160Y8¢5
.¢+
%"
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "ÿÿÿÿÿÿÿÿÿ
'__inference_dropout_layer_call_fn_10165Y8¢5
.¢+
%"
inputsÿÿÿÿÿÿÿÿÿ
p
ª "ÿÿÿÿÿÿÿÿÿÄ
A__inference_lstm_1_layer_call_and_return_conditional_losses_10369789P¢M
F¢C
52
0-
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

 
p 

 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 Ä
A__inference_lstm_1_layer_call_and_return_conditional_losses_10512789P¢M
F¢C
52
0-
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

 
p

 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 ´
A__inference_lstm_1_layer_call_and_return_conditional_losses_10655o789@¢=
6¢3
%"
inputsÿÿÿÿÿÿÿÿÿ

 
p 

 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 ´
A__inference_lstm_1_layer_call_and_return_conditional_losses_10798o789@¢=
6¢3
%"
inputsÿÿÿÿÿÿÿÿÿ

 
p

 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 
&__inference_lstm_1_layer_call_fn_10193r789P¢M
F¢C
52
0-
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

 
p 

 
ª "ÿÿÿÿÿÿÿÿÿ
&__inference_lstm_1_layer_call_fn_10204r789P¢M
F¢C
52
0-
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

 
p

 
ª "ÿÿÿÿÿÿÿÿÿ
&__inference_lstm_1_layer_call_fn_10215b789@¢=
6¢3
%"
inputsÿÿÿÿÿÿÿÿÿ

 
p 

 
ª "ÿÿÿÿÿÿÿÿÿ
&__inference_lstm_1_layer_call_fn_10226b789@¢=
6¢3
%"
inputsÿÿÿÿÿÿÿÿÿ

 
p

 
ª "ÿÿÿÿÿÿÿÿÿÏ
F__inference_lstm_cell_1_layer_call_and_return_conditional_losses_10981789¢
y¢v
!
inputsÿÿÿÿÿÿÿÿÿ
M¢J
# 
states/0ÿÿÿÿÿÿÿÿÿ
# 
states/1ÿÿÿÿÿÿÿÿÿ
p 
ª "v¢s
l¢i

0/0ÿÿÿÿÿÿÿÿÿ
GD
 
0/1/0ÿÿÿÿÿÿÿÿÿ
 
0/1/1ÿÿÿÿÿÿÿÿÿ
 Ï
F__inference_lstm_cell_1_layer_call_and_return_conditional_losses_11013789¢
y¢v
!
inputsÿÿÿÿÿÿÿÿÿ
M¢J
# 
states/0ÿÿÿÿÿÿÿÿÿ
# 
states/1ÿÿÿÿÿÿÿÿÿ
p
ª "v¢s
l¢i

0/0ÿÿÿÿÿÿÿÿÿ
GD
 
0/1/0ÿÿÿÿÿÿÿÿÿ
 
0/1/1ÿÿÿÿÿÿÿÿÿ
 ¤
+__inference_lstm_cell_1_layer_call_fn_10932ô789¢
y¢v
!
inputsÿÿÿÿÿÿÿÿÿ
M¢J
# 
states/0ÿÿÿÿÿÿÿÿÿ
# 
states/1ÿÿÿÿÿÿÿÿÿ
p 
ª "f¢c

0ÿÿÿÿÿÿÿÿÿ
C@

1/0ÿÿÿÿÿÿÿÿÿ

1/1ÿÿÿÿÿÿÿÿÿ¤
+__inference_lstm_cell_1_layer_call_fn_10949ô789¢
y¢v
!
inputsÿÿÿÿÿÿÿÿÿ
M¢J
# 
states/0ÿÿÿÿÿÿÿÿÿ
# 
states/1ÿÿÿÿÿÿÿÿÿ
p
ª "f¢c

0ÿÿÿÿÿÿÿÿÿ
C@

1/0ÿÿÿÿÿÿÿÿÿ

1/1ÿÿÿÿÿÿÿÿÿË
D__inference_lstm_cell_layer_call_and_return_conditional_losses_10883456¢
x¢u
 
inputsÿÿÿÿÿÿÿÿÿ
M¢J
# 
states/0ÿÿÿÿÿÿÿÿÿ
# 
states/1ÿÿÿÿÿÿÿÿÿ
p 
ª "v¢s
l¢i

0/0ÿÿÿÿÿÿÿÿÿ
GD
 
0/1/0ÿÿÿÿÿÿÿÿÿ
 
0/1/1ÿÿÿÿÿÿÿÿÿ
 Ë
D__inference_lstm_cell_layer_call_and_return_conditional_losses_10915456¢
x¢u
 
inputsÿÿÿÿÿÿÿÿÿ
M¢J
# 
states/0ÿÿÿÿÿÿÿÿÿ
# 
states/1ÿÿÿÿÿÿÿÿÿ
p
ª "v¢s
l¢i

0/0ÿÿÿÿÿÿÿÿÿ
GD
 
0/1/0ÿÿÿÿÿÿÿÿÿ
 
0/1/1ÿÿÿÿÿÿÿÿÿ
  
)__inference_lstm_cell_layer_call_fn_10834ò456¢
x¢u
 
inputsÿÿÿÿÿÿÿÿÿ
M¢J
# 
states/0ÿÿÿÿÿÿÿÿÿ
# 
states/1ÿÿÿÿÿÿÿÿÿ
p 
ª "f¢c

0ÿÿÿÿÿÿÿÿÿ
C@

1/0ÿÿÿÿÿÿÿÿÿ

1/1ÿÿÿÿÿÿÿÿÿ 
)__inference_lstm_cell_layer_call_fn_10851ò456¢
x¢u
 
inputsÿÿÿÿÿÿÿÿÿ
M¢J
# 
states/0ÿÿÿÿÿÿÿÿÿ
# 
states/1ÿÿÿÿÿÿÿÿÿ
p
ª "f¢c

0ÿÿÿÿÿÿÿÿÿ
C@

1/0ÿÿÿÿÿÿÿÿÿ

1/1ÿÿÿÿÿÿÿÿÿµ
?__inference_lstm_layer_call_and_return_conditional_losses_10012r456?¢<
5¢2
$!
inputsÿÿÿÿÿÿÿÿÿ

 
p 

 
ª "*¢'
 
0ÿÿÿÿÿÿÿÿÿ
 µ
?__inference_lstm_layer_call_and_return_conditional_losses_10155r456?¢<
5¢2
$!
inputsÿÿÿÿÿÿÿÿÿ

 
p

 
ª "*¢'
 
0ÿÿÿÿÿÿÿÿÿ
 Î
>__inference_lstm_layer_call_and_return_conditional_losses_9726456O¢L
E¢B
41
/,
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

 
p 

 
ª "3¢0
)&
0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 Î
>__inference_lstm_layer_call_and_return_conditional_losses_9869456O¢L
E¢B
41
/,
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

 
p

 
ª "3¢0
)&
0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 ¥
#__inference_lstm_layer_call_fn_9550~456O¢L
E¢B
41
/,
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

 
p 

 
ª "&#ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¥
#__inference_lstm_layer_call_fn_9561~456O¢L
E¢B
41
/,
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

 
p

 
ª "&#ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
#__inference_lstm_layer_call_fn_9572e456?¢<
5¢2
$!
inputsÿÿÿÿÿÿÿÿÿ

 
p 

 
ª "ÿÿÿÿÿÿÿÿÿ
#__inference_lstm_layer_call_fn_9583e456?¢<
5¢2
$!
inputsÿÿÿÿÿÿÿÿÿ

 
p

 
ª "ÿÿÿÿÿÿÿÿÿº
D__inference_sequential_layer_call_and_return_conditional_losses_8859r456789'(?¢<
5¢2
(%

lstm_inputÿÿÿÿÿÿÿÿÿ
p 

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 º
D__inference_sequential_layer_call_and_return_conditional_losses_8883r456789'(?¢<
5¢2
(%

lstm_inputÿÿÿÿÿÿÿÿÿ
p

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 ¶
D__inference_sequential_layer_call_and_return_conditional_losses_9220n456789'(;¢8
1¢.
$!
inputsÿÿÿÿÿÿÿÿÿ
p 

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 ¶
D__inference_sequential_layer_call_and_return_conditional_losses_9516n456789'(;¢8
1¢.
$!
inputsÿÿÿÿÿÿÿÿÿ
p

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 
)__inference_sequential_layer_call_fn_8385e456789'(?¢<
5¢2
(%

lstm_inputÿÿÿÿÿÿÿÿÿ
p 

 
ª "ÿÿÿÿÿÿÿÿÿ
)__inference_sequential_layer_call_fn_8835e456789'(?¢<
5¢2
(%

lstm_inputÿÿÿÿÿÿÿÿÿ
p

 
ª "ÿÿÿÿÿÿÿÿÿ
)__inference_sequential_layer_call_fn_8910a456789'(;¢8
1¢.
$!
inputsÿÿÿÿÿÿÿÿÿ
p 

 
ª "ÿÿÿÿÿÿÿÿÿ
)__inference_sequential_layer_call_fn_8931a456789'(;¢8
1¢.
$!
inputsÿÿÿÿÿÿÿÿÿ
p

 
ª "ÿÿÿÿÿÿÿÿÿ§
"__inference_signature_wrapper_9539456789'(E¢B
¢ 
;ª8
6

lstm_input(%

lstm_inputÿÿÿÿÿÿÿÿÿ"-ª*
(
dense
denseÿÿÿÿÿÿÿÿÿ