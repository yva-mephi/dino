import React, { useState, useEffect } from 'react';
import Toggle from '../../utils/Toggle.jsx';
import { useTheme } from '../../utils/ThemeContext.jsx';
import AppsIcon from '@mui/icons-material/Apps';
import SearchIcon from '@mui/icons-material/Search';
import AssistantIcon from '@mui/icons-material/Assistant';

const Header = () => {
    const [isFocused, setIsFocused] = useState(false);
    const [searchInput, setSearchInput] = useState('');
    const { isDarkMode } = useTheme();
    const [isAnimating, setIsAnimating] = useState(false);

    useEffect(() => {
        setIsAnimating(true);
        const timer = setTimeout(() => setIsAnimating(false), 1000); // Длительность анимации
        return () => clearTimeout(timer);
    }, [isDarkMode]);

    return (
        <header className="headerEntry">
            <div className="logoEntry">
                <a href="/" className="header-link">
                    <img
                        src={isDarkMode ? "./logodark.svg" : "./logo.svg"}
                        alt="edu by yava"
                        className={`logomode ${isAnimating ? 'animate' : ''}`}
                    />
                    <div className="logo-text">
                        <span>project</span>
                        <span>by yava</span>
                    </div>
                </a>
            </div>
            <div
                className={`searchEntry${isFocused ? 'focused' : ''}`}>
                <div className={`search-container${isFocused ? 'focused' : ''}`}>
                    <AssistantIcon className="assistant-icon" />
                    <input
                        type="text"
                        className="search-input"
                        placeholder="Поиск..."
                        value={searchInput}
                        onFocus={() => setIsFocused(true)}
                        onBlur={() => setIsFocused(false)}
                        onChange={(e) => setSearchInput(e.target.value)}
                    />
                    <SearchIcon className="search-icon" />
                    <AppsIcon className="app-icon" />
                </div>
            </div>
            <div className="toggleContainer">
                <Toggle />
            </div>
        </header>
    )
}

export default Header;