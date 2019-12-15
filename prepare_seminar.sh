echo Start downloading constituency data
wget 'https://raw.githubusercontent.com/nikitakit/self-attentive-parser/master/data/02-21.10way.clean'
mv 02-21.10way.clean train_con.txt
wget 'https://raw.githubusercontent.com/nikitakit/self-attentive-parser/master/data/22.auto.clean'
mv 22.auto.clean dev_con.txt
wget 'https://raw.githubusercontent.com/nikitakit/self-attentive-parser/master/data/23.auto.clean'
mv 23.auto.clean test_con.txt
echo Finished downloading constituency data

echo Downloading stanford parser
wget 'https://raw.githubusercontent.com/DoodleJZ/HPSG-Neural-Parser/master/data/stanford-parser_3.3.0.jar'
echo Finisehd downloading stanford parser


echo Start converting constituency to dependency
java -cp stanford-parser_3.3.0.jar edu.stanford.nlp.trees.EnglishGrammaticalStructure -basic -keepPunct -conllx -treeFile train_con.txt > train_dep.txt
java -cp stanford-parser_3.3.0.jar edu.stanford.nlp.trees.EnglishGrammaticalStructure -basic -keepPunct -conllx -treeFile dev_con.txt > dev_dep.txt
java -cp stanford-parser_3.3.0.jar edu.stanford.nlp.trees.EnglishGrammaticalStructure -basic -keepPunct -conllx -treeFile test_con.txt > test_dep.txt
echo Finised converting constituency to dependency

echo Move data to ./data/ directory
mkdir -p data/

mv train_dep.txt data/
mv test_dep.txt data/
mv dev_dep.txt data/
mv train_con.txt data/
mv test_con.txt data/
mv dev_con.txt data/

echo Downloading models...
mkdir -p models/

echo Download glove model for dozat parser ...
wget https://github.com/allenai/spv2/raw/master/model/glove.6B.100d.txt.gz
echo Extracting model ...
gzip -d glove.6B.100d.txt.gz
mv glove.6B.100d.txt models/
echo Finished preparing glove model

echo Download pytorch model for Kitaev parser ...
wget https://github.com/nikitakit/self-attentive-parser/releases/download/models/en_charlstm_dev.93.61.pt
mv en_charlstm_dev.93.61.pt models/
echo Downloaded


# https://lindat.mff.cuni.cz/repository/xmlui/handle/11234/1-2837?show=full

# Задание: применить любой конституент парсер для оригинального PTB, депенденси парсер для сконвертированного PTB и CoNLL2018. 
# Рекомендованные парсеры - для составляющих span extractor или любой его наследник (например, Kitaev & Klein 2018), для депенденси - Dozat & Manning 2017 или любой его наследник (напр. UDPipe Future)
