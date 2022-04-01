module.exports = {
	content: [
		"./index.html",
		"./src/**/*.{vue,js}",
	],
	theme: {
		fontFamily: {
			montserrat: ['Montserrat', 'sans-serif'],
			helvetica: ['HelveticaNeueCry', 'sans-serif'],
		},
    colors:{
      primary:{
        DEFAULT: '#D9D2E8', // 4
				1: '#e7e5ec',
        4: '#D9D2E8',
        9: '#563188',
      },
      gray: {
        DEFAULT: '#EDEDEE', // 3
        3: '#EDEDEE',
      },
      white: 'white',
      black: 'black',
    },
		boxShadow:{
			DEFAULT: '0px 10px 50px rgba(1, 1, 1, 0.2)', // dark
			dark: '0px 10px 50px rgba(1, 1, 1, 0.2)',
			light: '0px 10px 50px rgba(86, 49, 136, 0.2)',
		},
		container: {
			center: true,
		},
		screens: {
			'sm': '640px',
			'md': '768px',
			'lg': '1024px',
			'xl': '1280px',
			'2xl': '1440px',
		},
		extend: {},
	},
	plugins: [],
}
