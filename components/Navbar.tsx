'use client'

import { useState, useEffect } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { useTheme } from './ThemeProvider'
import { 
  Bars3Icon, 
  XMarkIcon, 
  ShoppingCartIcon, 
  SunIcon, 
  MoonIcon,
  TicketIcon,
  CalendarDaysIcon,
  HomeIcon,
  ShoppingBagIcon,
  PhoneIcon
} from '@heroicons/react/24/outline'

const navigation = [
  { name: 'Home', href: '/', icon: HomeIcon },
  { name: 'Shop', href: '/shop', icon: ShoppingBagIcon },
  { name: 'Events/Tickets', href: '/events', icon: TicketIcon },
  { name: 'Bookings', href: '/bookings', icon: CalendarDaysIcon },
  { name: 'Contact', href: '/contact', icon: PhoneIcon },
]

export default function Navbar() {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false)
  const [cartItems, setCartItems] = useState(0)
  const { theme, toggleTheme } = useTheme()

  useEffect(() => {
    // Get cart items from localStorage
    const cart = JSON.parse(localStorage.getItem('cart') || '[]')
    setCartItems(cart.length)
  }, [])

  return (
    <header className="sticky top-0 z-50 bg-white/90 dark:bg-gray-900/90 backdrop-blur-md border-b border-gray-200 dark:border-gray-700">
      <nav className="mx-auto flex max-w-7xl items-center justify-between p-4 lg:px-8" aria-label="Global">
        {/* Logo */}
        <div className="flex lg:flex-1">
          <Link href="/" className="-m-1.5 p-1.5 flex items-center space-x-3">
            <div className="w-12 h-12 bg-gradient-to-br from-primary-500 to-secondary-500 rounded-full flex items-center justify-center">
              <span className="text-white font-bold text-xl">S</span>
            </div>
            <div className="hidden sm:block">
              <h1 className="text-2xl font-display font-bold bg-gradient-to-r from-primary-600 to-secondary-600 bg-clip-text text-transparent">
                Slumpers
              </h1>
              <p className="text-xs text-gray-600 dark:text-gray-400 font-medium">
                Taking Over The Scene
              </p>
            </div>
          </Link>
        </div>

        {/* Mobile menu button */}
        <div className="flex lg:hidden">
          <button
            type="button"
            className="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700 dark:text-gray-300"
            onClick={() => setMobileMenuOpen(true)}
          >
            <span className="sr-only">Open main menu</span>
            <Bars3Icon className="h-6 w-6" aria-hidden="true" />
          </button>
        </div>

        {/* Desktop navigation */}
        <div className="hidden lg:flex lg:gap-x-8">
          {navigation.map((item) => (
            <Link
              key={item.name}
              href={item.href}
              className="flex items-center space-x-2 text-sm font-semibold leading-6 text-gray-900 dark:text-gray-100 hover:text-primary-600 dark:hover:text-primary-400 transition-colors duration-200"
            >
              <item.icon className="h-4 w-4" />
              <span>{item.name}</span>
            </Link>
          ))}
        </div>

        {/* Right side buttons */}
        <div className="hidden lg:flex lg:flex-1 lg:justify-end lg:items-center lg:space-x-4">
          {/* Theme toggle */}
          <button
            onClick={toggleTheme}
            className="p-2 rounded-lg bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 transition-colors duration-200"
            aria-label="Toggle theme"
          >
            {theme === 'light' ? (
              <MoonIcon className="h-5 w-5 text-gray-600 dark:text-gray-400" />
            ) : (
              <SunIcon className="h-5 w-5 text-gray-600 dark:text-gray-400" />
            )}
          </button>

          {/* Cart */}
          <Link
            href="/cart"
            className="relative p-2 rounded-lg bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 transition-colors duration-200"
          >
            <ShoppingCartIcon className="h-5 w-5 text-gray-600 dark:text-gray-400" />
            {cartItems > 0 && (
              <span className="absolute -top-1 -right-1 bg-primary-500 text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">
                {cartItems}
              </span>
            )}
          </Link>
        </div>
      </nav>

      {/* Mobile menu */}
      {mobileMenuOpen && (
        <div className="lg:hidden">
          <div className="fixed inset-0 z-50" />
          <div className="fixed inset-y-0 right-0 z-50 w-full overflow-y-auto bg-white dark:bg-gray-900 px-6 py-6 sm:max-w-sm sm:ring-1 sm:ring-gray-900/10">
            <div className="flex items-center justify-between">
              <Link href="/" className="-m-1.5 p-1.5 flex items-center space-x-3">
                <div className="w-10 h-10 bg-gradient-to-br from-primary-500 to-secondary-500 rounded-full flex items-center justify-center">
                  <span className="text-white font-bold text-lg">S</span>
                </div>
                <div>
                  <h1 className="text-xl font-display font-bold bg-gradient-to-r from-primary-600 to-secondary-600 bg-clip-text text-transparent">
                    Slumpers
                  </h1>
                </div>
              </Link>
              <button
                type="button"
                className="-m-2.5 rounded-md p-2.5 text-gray-700 dark:text-gray-300"
                onClick={() => setMobileMenuOpen(false)}
              >
                <span className="sr-only">Close menu</span>
                <XMarkIcon className="h-6 w-6" aria-hidden="true" />
              </button>
            </div>
            <div className="mt-6 flow-root">
              <div className="-my-6 divide-y divide-gray-500/10">
                <div className="space-y-2 py-6">
                  {navigation.map((item) => (
                    <Link
                      key={item.name}
                      href={item.href}
                      className="-mx-3 flex items-center space-x-3 rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 dark:text-gray-100 hover:bg-gray-50 dark:hover:bg-gray-800"
                      onClick={() => setMobileMenuOpen(false)}
                    >
                      <item.icon className="h-5 w-5" />
                      <span>{item.name}</span>
                    </Link>
                  ))}
                </div>
                <div className="py-6 flex items-center justify-between">
                  <button
                    onClick={toggleTheme}
                    className="flex items-center space-x-2 text-base font-semibold leading-7 text-gray-900 dark:text-gray-100"
                  >
                    {theme === 'light' ? (
                      <>
                        <MoonIcon className="h-5 w-5" />
                        <span>Dark Mode</span>
                      </>
                    ) : (
                      <>
                        <SunIcon className="h-5 w-5" />
                        <span>Light Mode</span>
                      </>
                    )}
                  </button>
                  <Link
                    href="/cart"
                    className="relative p-2 rounded-lg bg-gray-100 dark:bg-gray-800"
                    onClick={() => setMobileMenuOpen(false)}
                  >
                    <ShoppingCartIcon className="h-5 w-5 text-gray-600 dark:text-gray-400" />
                    {cartItems > 0 && (
                      <span className="absolute -top-1 -right-1 bg-primary-500 text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">
                        {cartItems}
                      </span>
                    )}
                  </Link>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
    </header>
  )
}
