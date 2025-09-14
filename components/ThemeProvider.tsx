'use client'

import React, { createContext, useContext, useEffect, useState, useCallback, ReactNode } from 'react'

type Theme = 'light' | 'dark'

interface ThemeContextType {
  theme: Theme
  toggleTheme: () => void
  isDark: boolean
}

const ThemeContext = createContext<ThemeContextType | undefined>(undefined)

// Type guard to check if a string is a valid theme
const isValidTheme = (theme: string): theme is Theme => {
  return theme === 'light' || theme === 'dark'
}

interface ThemeProviderProps {
  children: ReactNode;
}

export function ThemeProvider({ children }: ThemeProviderProps) {
  const [theme, setTheme] = useState<Theme>('light')
  const [mounted, setMounted] = useState(false)
  const isDark = theme === 'dark'

  // Only run on client-side
  useEffect(() => {
    // Check for saved theme preference
    const savedTheme = localStorage.getItem('theme')
    if (savedTheme && isValidTheme(savedTheme)) {
      setTheme(savedTheme)
    } else if (typeof window !== 'undefined' && window.matchMedia('(prefers-color-scheme: dark)').matches) {
      setTheme('dark')
    }
    setMounted(true)
  }, [])

  // Update the theme class on the html element and save to localStorage
  useEffect(() => {
    if (!mounted) return
    
    // Save to localStorage
    localStorage.setItem('theme', theme)
    
    // Update the class on the html element
    const root = window.document.documentElement
    root.classList.remove('light', 'dark')
    root.classList.add(theme)
    
    // For Tailwind dark mode
    if (theme === 'dark') {
      root.classList.add('dark')
    } else {
      root.classList.remove('dark')
    }
  }, [theme, mounted])

  const toggleTheme = useCallback(() => {
    setTheme((prev: Theme) => (prev === 'light' ? 'dark' : 'light'))
  }, [])

  // Don't render the children until we know the theme to prevent hydration mismatch
  if (!mounted) {
    return (
      <div className="hidden" suppressHydrationWarning>
        {children}
      </div>
    )
  }

  return (
    <ThemeContext.Provider value={{ theme, toggleTheme, isDark }}>
      {children}
    </ThemeContext.Provider>
  )
}

export function useTheme() {
  const context = useContext(ThemeContext)
  if (context === undefined) {
    throw new Error('useTheme must be used within a ThemeProvider')
  }
  return context
}
