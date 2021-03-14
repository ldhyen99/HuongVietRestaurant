import * as React from 'react';
import { Route, Switch } from 'react-router-dom';
import { Redirect } from 'react-router';
import { Loading } from '../Layout/Loading';

const routes = [
    {
        name: 'Home',
        component: React.lazy(() => Promise.all([
            import('./Home'),
            new Promise((resolve) => setTimeout(resolve, 100)),
            // import('@app/Modules/Home'),
        ])
            .then(([moduleExports]) => moduleExports)),
        path: '/HuongVietRestaurant/',
        id: 'home',
        exact: true,
    },
    {
        name: 'Menu',
        component: React.lazy(() => Promise.all([
            import('./Product'),
            new Promise((resolve) => setTimeout(resolve, 100)),
            // import('@app/Modules/Home'),
        ])
            .then(([moduleExports]) => moduleExports)),
        path: '/HuongVietRestaurant/menu',
        id: 'menu',
        exact: true,
    },

];

const MakeRoute = () => (
    <React.Suspense fallback={<Loading />}>
        <Switch>
            {
                routes.map((route) => (
                    <Route
                        exact={route.exact || false}
                        path={route.path}
                        key={route.id}
                        component={route.component}
                    />
                ))
            }
      ))
      <Redirect from="/HuongVietRestaurant/home" to="/HuongVietRestaurant/" />
        </Switch>
    </React.Suspense>
);

export default MakeRoute;
