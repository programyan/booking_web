import React from 'react'
import { Provider } from 'react-redux'

import getStore from 'store/getStore'
import ProductsList from './ProductsList'

const ProductsListApp = () =>
  <Provider store={getStore()}>
    <ProductsList/>
  </Provider>


export default ProductsListApp
