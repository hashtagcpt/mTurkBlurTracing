#!/usr/bin/env sh
#
# Copyright 2008 Amazon Technologies, Inc.
# 
# Licensed under the Amazon Software License (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at:
# 
# http://aws.amazon.com/asl
# 
# This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
# OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and
# limitations under the License.

cat='aeroplane'
current_dir='../samples/image-segmentation';
label=$current_dir/amt/$cat 
input=$current_dir/amt/$cat.input
question=$current_dir/amt/$cat.question
properties=$current_dir/amt/$cat.properties
echo "run on category : $cat"
cd ../../bin
./loadHITs.sh -label $label -input $input -question $question -properties $properties -sandbox -maxhits 1


