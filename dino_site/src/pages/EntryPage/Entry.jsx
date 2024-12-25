import React from 'react';
import Header from './Header.jsx';
import Main from './Main.jsx';
import Footer from './Footer.jsx';
import './EntryStyles.scss'
import { useTheme } from '../../utils/ThemeContext.jsx';

const Entry = () => {
    const { isDarkMode } = useTheme();

    return (
        <div className = {`EntryPage ${isDarkMode ? 'darkMode' : ''}`}>
            <Header />
            <Main />
            <Footer />
        </div>
    );
};

export default Entry;