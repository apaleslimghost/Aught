require! {
	aught: './index.js'
	'expect.js'
	fs
}

export 'Aught':
	'adds to require.extensions': ->
		aught '.txt'
		expect require.extensions .to.have.property \.txt
		delete require.extensions\.txt
	'outputs file contents': ->
		fs.write-file-sync './test.txt' 'hello world'
		aught '.txt'
		expect require './test.txt' .to.be 'hello world'
		delete require.extensions\.txt
		fs.unlink-sync './test.txt'
