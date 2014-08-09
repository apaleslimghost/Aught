require! fs

module.exports = (ext)->
	require.extensions[ext] = (module, filename)->
		content = "module.exports = #{JSON.stringify fs.read-file-sync filename, \utf8};"
		module._compile content, filename
