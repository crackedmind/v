module deflate

fn test_compress() {
	mut test_data := 'Hellooo, wwwwwooorld!'.bytes()

	mut compressed := deflate.compress(test_data) or {
		eprintln(err)
		assert false
		return
	}

	mut uncompressed := deflate.uncompress(compressed) or {
		eprintln(err)
		assert false
		return
	}

	assert test_data == uncompressed
	compressed[3] = byte(1)

	uncompressed = deflate.uncompress(compressed) or {
		assert 'data error' == err
		return
	}

	compressed = deflate.compress_with_level(test_data, .best_compression) or {
		eprintln(err)
		assert false
		return
	}
}
