import React, { createContext, useContext, useState } from 'react';

// Создаем контекст
const ThemeContext = createContext();

// Создаем провайдер
export const ThemeProvider = ({ children }) => {
    const [isDarkMode, setIsDarkMode] = useState(false);

    const toggleTheme = () => {
        setIsDarkMode(prevMode => !prevMode);
    };

    return (
        <ThemeContext.Provider value={{ isDarkMode, toggleTheme }}>
            {children}
        </ThemeContext.Provider>
    );
};

// Создаем хук для использования контекста
export const useTheme = () => {
    return useContext(ThemeContext);
};